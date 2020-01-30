#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, GKVideoPlayState) {
    GKVideoPlayPreparing =  1,
    GKVideoPlayReady     =  2,
    GKVideoPlayOpen      =  3,
    GKVideoPlayCaching   =  4,
    GKVideoPlayPlaying   =  5,
    GKVideoPlayPaused    =  6,
    GKVideoPlayStopped   =  7,
    GKVideoPlayError     =  8,
    GKVideoPlayFinish    =  9,
};
@class GKBasePlayer,GKBaseView;
@protocol GKVideoPlayerDelegate<NSObject>
@optional
- (void)player:(GKBasePlayer *)player cache:(CGFloat)cache;
- (void)player:(GKBasePlayer *)player state:(GKVideoPlayState)state;
- (void)player:(GKBasePlayer *)player progress:(NSTimeInterval)progress;
@end
@interface GKBasePlayer : NSObject
@property (assign, nonatomic) id<GKVideoPlayerDelegate>delegate;
@property (strong, nonatomic, readonly) UIView *contentView;
@property (assign, nonatomic, readonly) NSTimeInterval current;
@property (assign, nonatomic, readonly) NSTimeInterval duration;
@property (assign, nonatomic, readonly) BOOL playing;
- (void)playUrl:(NSString *)url;
- (void)seek:(NSTimeInterval)time;
- (void)play;
- (void)stop;
- (void)pause;
- (void)resume;
@end
