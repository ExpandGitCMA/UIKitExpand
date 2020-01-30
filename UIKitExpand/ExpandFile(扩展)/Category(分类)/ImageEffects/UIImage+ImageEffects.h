@import UIKit;
@interface UIImage (ImageEffects)
- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;
- (UIImage *)rotateByDegrees:(CGFloat)degrees;
- (UIImage *)imagePixelFromColor:(UIColor *)color;
+ (UIImage *)imageFromColor:(UIColor *)color withSize:(CGSize)size;
- (UIImage *)radiuslayer;
- (UIImage *)localizeFitImage;
@end
