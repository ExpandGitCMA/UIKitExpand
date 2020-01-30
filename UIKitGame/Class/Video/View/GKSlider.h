#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface GKSlider : UISlider
@property (strong, nonatomic) UIProgressView *progressView;
@property (assign, nonatomic) BOOL progress;
@end
NS_ASSUME_NONNULL_END
