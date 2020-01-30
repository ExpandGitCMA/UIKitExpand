//
//  GKAVPlayer.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/18.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKAVPlayer.h"
#import "VIMediaCache.h"
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
static NSString *rate = @"rate";
static NSString *status = @"status";
static NSString *frame = @"bounds";
static NSString *loadedTimeRanges = @"loadedTimeRanges";
static NSString *playbackBufferEmpty = @"playbackBufferEmpty";
static NSString *playbackLikelyToKeepUp = @"playbackLikelyToKeepUp";
@interface GKAVPlayer() {
    id _playTimeObserver;
}
@property (strong, nonatomic) VIResourceLoaderManager *task;
@property (assign, nonatomic) GKVideoPlayState state;
@property (strong, nonatomic) AVPlayer       *player;
@property (strong, nonatomic) AVPlayerItem   *playerItem;
@property (strong, nonatomic) AVPlayerLayer  *playerLayer;
@property (assign, nonatomic) BOOL seek;
@property (assign, nonatomic) BOOL isPlaying;//切后台播放器会暂停 所以做个标记 切后台钱如果是暂停进来也暂停
@end

@implementation GKAVPlayer
- (void)dealloc{
    [self releasePlayer];
}
- (void)releasePlayer
{
    if (!_playerItem) {
        return;
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.playerItem removeObserver:self forKeyPath:status];
    [self.playerItem removeObserver:self forKeyPath:loadedTimeRanges];
    [self.playerItem removeObserver:self forKeyPath:playbackBufferEmpty];
    [self.playerItem removeObserver:self forKeyPath:playbackLikelyToKeepUp];
    [self.player removeTimeObserver:_playTimeObserver];
    [self.player removeObserver:self forKeyPath:rate];
    [self.contentView removeObserver:self forKeyPath:frame];
    if (_playerLayer.superlayer) {
        [_playerLayer removeFromSuperlayer];
    }
    _playerLayer = nil;
    _playTimeObserver = nil;
    _playerItem = nil;
}
- (void)playUrl:(NSString *)url{
    assert(url);
    [self releasePlayer];
    NSURL * urlPath = [url rangeOfString:@"/"].location == 0 ? [NSURL fileURLWithPath:url]:[NSURL URLWithString:url];
//    边下边播
//    self.playerItem =  [self.task playerItemWithURL:urlPath];
//    VICacheConfiguration *configuration = [VICacheManager cacheConfigurationForURL:urlPath];
//    if (configuration.progress >= 1.0) {
//        NSLog(@"cache completed");
//    }
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:urlPath options:nil];
    self.playerItem = [AVPlayerItem playerItemWithAsset:urlAsset];
    if (!self.player) {
        self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
    }else{
        [self.player replaceCurrentItemWithPlayerItem:self.playerItem];
    }
    if (@available(iOS 10.0, *)) {
        self.player.automaticallyWaitsToMinimizeStalling = NO;
    }
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    [self.contentView.layer insertSublayer:self.playerLayer atIndex:0];
    self.playerLayer.frame = self.contentView.frame;
    [self addNotification];
    [self readyPlay];
    [self.player play];
    self.state = GKVideoPlayPreparing;
}
- (void)seek:(NSTimeInterval)time{
    @weakify(self)
    self.seek = YES;
    [self.player seekToTime:CMTimeMakeWithSeconds(time, NSEC_PER_SEC) completionHandler:^(BOOL finished) {
        @strongify(self)
        NSLog(@"finish");
        self.seek = !finished;
    }];
    
}
- (void)play{
    if (!self.playing) {
        [self.player play];
    }
}
- (void)stop{
    [self pause];
    [self releasePlayer];
    self.state = GKVideoPlayStopped;
}
- (void)pause{
    if (self.playing) {
        [self.player pause];
    }
}
- (void)resume{
    [self play];
}
- (BOOL)playing{
    return self.player.rate > 0;
}
- (NSTimeInterval)current{
    NSTimeInterval time = CMTimeGetSeconds(self.player.currentTime);
    return time >0 ?time :0;
}
- (NSTimeInterval)duration{
    NSTimeInterval time = CMTimeGetSeconds(self.playerItem.duration);
    return time >0 ?time :0;
}
- (void)addNotification{
    [self.playerItem addObserver:self forKeyPath:status options:NSKeyValueObservingOptionNew context:nil];
    [self.playerItem addObserver:self forKeyPath:loadedTimeRanges options:NSKeyValueObservingOptionNew context:nil];
    [self.playerItem addObserver:self forKeyPath:playbackBufferEmpty options:NSKeyValueObservingOptionNew context:nil];
    [self.playerItem addObserver:self forKeyPath:playbackLikelyToKeepUp options:NSKeyValueObservingOptionNew context:nil];
    [self.player addObserver:self   forKeyPath:rate  options:NSKeyValueObservingOptionNew    context:nil];
    [self.contentView addObserver:self forKeyPath:frame options:NSKeyValueObservingOptionNew context:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidPlayToEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.playerItem];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemPlaybackStalled:) name:AVPlayerItemPlaybackStalledNotification object:self.playerLayer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidEnterBackground) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidEnterPlayGround) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)playerItemDidPlayToEnd:(NSNotification *)notification
{
    self.state = GKVideoPlayFinish;
}
- (void)playerItemPlaybackStalled:(NSNotification *)notification
{
    // 这里网络不好的时候，就会进入，不做处理，会在playbackBufferEmpty里面缓存之后重新播放
    self.state = GKVideoPlayCaching;
}
- (void)appDidEnterBackground
{
    self.isPlaying = self.playing;
    [self pause];
}
- (void)appDidEnterPlayGround
{
    if (self.isPlaying) {
        [self resume];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:status]) {
        AVPlayerItem *item = (AVPlayerItem *)object;
        self.playerItem = item;
        switch (item.status) {
            case AVPlayerStatusReadyToPlay:
                self.state =GKVideoPlayReady;
                break;
            default:
                self.state =GKVideoPlayError;
                break;
        }
    } else if ([keyPath isEqualToString:loadedTimeRanges]) {
        AVPlayerItem *item = (AVPlayerItem *)object;
        self.playerItem = item;
        [self progressCache:item];
    } else if ([keyPath isEqualToString:playbackBufferEmpty]) {
        self.state = GKVideoPlayCaching;
    }else if ([keyPath isEqualToString:playbackLikelyToKeepUp]){
        NSLog(@"playbackLikelyToKeepUp");
    }else if ([keyPath isEqualToString:rate]){
        AVPlayer *player = (AVPlayer *)object;
        self.player = player;
        if (player.rate == 0) {
           self.state = GKVideoPlayPaused;
        }
       else if (player.rate >0) {
            self.state = GKVideoPlayPlaying;
        }
    }else if ([keyPath isEqualToString:frame]){
        UIView *mainView = (UIView *)object;
        self.playerLayer.frame = CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height);
    }
    
}
- (void)readyPlay
{
    @weakify(self)
    self.seek = NO;
    _playTimeObserver = [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 10) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        @strongify(self)
        if (self.seek) {
            return ;
        }
         NSTimeInterval timeInSeconds = CMTimeGetSeconds(time);
        if ([self.delegate respondsToSelector:@selector(player:progress:)] && timeInSeconds > 0) {
            [self.delegate player:self progress:timeInSeconds];
        }
    }];
}
- (void)progressCache:(AVPlayerItem *)playerItem
{
    NSArray *loadedTimeRanges = [playerItem loadedTimeRanges];
    CMTimeRange timeRange = [loadedTimeRanges.firstObject CMTimeRangeValue];// 获取缓冲区域
    float startSeconds = CMTimeGetSeconds(timeRange.start);
    float durationSeconds = CMTimeGetSeconds(timeRange.duration);
    NSTimeInterval timeInterval = startSeconds + durationSeconds;// 计算缓冲总进度
    CGFloat duration = CMTimeGetSeconds(playerItem.duration);
    if ([self.delegate respondsToSelector:@selector(player:cache:)]&&duration > 0) {
        [self.delegate player:self cache:timeInterval/duration];
    }
}
- (void)setState:(GKVideoPlayState)state{
    if (_state != state) {
        _state = state;
        if ([self.delegate respondsToSelector:@selector(player:state:)]) {
            [self.delegate player:self state:_state];
        }
    }
}
- (VIResourceLoaderManager *)task{
    if (!_task) {
        _task = [[VIResourceLoaderManager alloc] init];
    }
    return _task;
}
@end
