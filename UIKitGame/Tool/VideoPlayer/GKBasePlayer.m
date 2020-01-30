#import "GKBasePlayer.h"
@interface GKBasePlayer()
@property (strong, nonatomic) UIView *contentView;
@end
@implementation GKBasePlayer
- (void)playUrl:(NSString *)url{
}
- (void)seek:(NSTimeInterval)time{
}
- (void)play{
}
- (void)stop{
}
- (void)pause{
}
- (void)resume{
}
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}
@end
