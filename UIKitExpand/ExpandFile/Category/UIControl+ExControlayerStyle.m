#import "UIControl+ExControlayerStyle.h"
@implementation UIControl (ExControlayerStyle)
-(void)searchNormalStyle{
    self.layer.cornerRadius=14.0f;
    self.layer.masksToBounds=YES;
    self.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor clearColor]);
    self.layer.borderWidth= 1.0f;
}
@end
