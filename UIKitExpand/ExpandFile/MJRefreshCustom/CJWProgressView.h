#import <UIKit/UIKit.h>
#import "AppUrlprotocol.h"
@interface CJWProgressView : UIView
@property (nonatomic) CGFloat progress;
@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) CGFloat radius;
@property (nonatomic) UIColor *tintColor;
@property (nonatomic) UIView *backgroundView;
@property (nonatomic) CAShapeLayer *progressLayer;
@property (nonatomic) UIImageView *iconImgV;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;
@end
