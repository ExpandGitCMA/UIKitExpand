//
//  GKVideoPlayer.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/12.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKVideoPlayer.h"
@interface GKVideoPlayer()<PLPlayerDelegate>
@property (strong, nonatomic) PLPlayer *player;
@property (strong, nonatomic) NSTimer *timer;
@property (copy, nonatomic) NSString *url;

@property (assign, nonatomic) GKVideoPlayState state;

@end

@implementation GKVideoPlayer

- (PLPlayer *)player{
    if (!_player) {
        _player = [PLPlayer playerWithURL:[NSURL URLWithString:self.url] option:[PLPlayerOption defaultOption]];
        _player.delegate = self;
        _player.delegateQueue = dispatch_get_main_queue();
        _player.playerView.layer.masksToBounds = YES;
        //_player.playerView.contentMode = UIViewContentModeScaleAspectFit;
        _player.rotationMode = PLPlayerNoRotation;
        _player.backgroundPlayEnable = NO;
    }
    return _player;
}
- (void)playUrl:(NSString *)url{
    if (_player.playerView) {
        [_player stop];
        [_player.playerView removeFromSuperview];
        _player = nil;
    }
    self.url = url;
    [self.contentView addSubview:self.player.playerView];
    [self.player.playerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.player.playerView.superview);
    }];
    [self play];
}
- (void)seek:(NSTimeInterval)time{
    [self.player seekTo: CMTimeMake(time, 1)];
}
- (void)play{
    [self.player play];
    [self startTimer];
}
- (void)stop{
    [self.player stop];
    [self closeTimer];
}
- (void)pause{
    [self.player pause];
    [self closeTimer];
}
- (void)resume{
    [self.player resume];
    [self startTimer];
}
- (BOOL)playing{
    return self.player.isPlaying;
}
- (NSTimeInterval)current{
    return CMTimeGetSeconds(self.player.currentTime);
}
- (NSTimeInterval)duration{
    return CMTimeGetSeconds(self.player.totalDuration);
}
- (void)startTimer{
    [self closeTimer];
    @weakify(self)
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^(NSTimer * _Nonnull timer) {
        @strongify(self)
        [self progress];
    } repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)closeTimer{
    if ([self.timer isValid]) {
        [self.timer invalidate];
        self.timer = nil;
    }
}
#pragma mark PLPlayerDelegate
- (void)player:(nonnull PLPlayer *)player statusDidChange:(PLPlayerStatus)state{
    NSLog(@"statusDidChange=%@",@(state));
    switch (state) {
        case PLPlayerStatusOpen:
            self.state = GKVideoPlayOpen;
            break;
        case PLPlayerStatusPreparing:
            self.state = GKVideoPlayPreparing;
            break;
        case PLPlayerStatusReady:
            self.state = GKVideoPlayReady;
            break;
        case PLPlayerStatusCaching:
            self.state = GKVideoPlayCaching;
            break;
        case PLPlayerStatusPlaying:
            self.state = GKVideoPlayPlaying;
            break;
        case PLPlayerStatusPaused:
            self.state = GKVideoPlayPaused;
            break;
        case PLPlayerStatusStopped:
            self.state = GKVideoPlayStopped;
            break;
        case PLPlayerStatusCompleted:
            self.state = GKVideoPlayFinish;
            [self closeTimer];
            break;
        default:
            self.state = GKVideoPlayError;
            break;
    }
}
- (void)player:(nonnull PLPlayer *)player seekToCompleted:(BOOL)isCompleted{
//    if (isCompleted) {
//        self.state = GKVideoPlayFinish;
//    }
}
- (void)player:(nonnull PLPlayer *)player stoppedWithError:(nullable NSError *)error{
    if (error) {
        self.state = GKVideoPlayError;
    }
}
- (void)player:(nonnull PLPlayer *)player loadedTimeRange:(CMTime)timeRange{
    if (self.duration > 0) {
        if ([self.delegate respondsToSelector:@selector(player:cache:)]) {
            CGFloat value = CMTimeGetSeconds(timeRange)/self.duration;
            [self.delegate player:self cache:value];
        }
    }
}

- (void)progress{
    NSTimeInterval current = CMTimeGetSeconds(self.player.currentTime);
    if ([self.delegate respondsToSelector:@selector(player:progress:)]){
        [self.delegate player:self progress:current];
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
@end
