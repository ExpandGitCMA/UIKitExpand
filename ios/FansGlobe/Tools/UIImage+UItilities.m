#import "UIImage+UItilities.h"

@implementation UIImage (UItilities)

+(UIImage *)createImageWithView:(UIView *)view{
    CGSize s = view.bounds.size;
     UIGraphicsBeginImageContextWithOptions(s, NO,[UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
