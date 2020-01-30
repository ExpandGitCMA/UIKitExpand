#import "BaseView.h"
@implementation BaseView
- (void)dealloc
{
    NSLog(@"Class View %@ is dealloc",[self class]);
}
@end
