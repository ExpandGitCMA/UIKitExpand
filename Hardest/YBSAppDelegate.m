#import "YBSAppDelegate.h"
#import "YBSAppJumpConterl.h"
@interface YBSAppDelegate ()
@end
@implementation YBSAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [YBSAppJumpConterl jumpBaserConterl];
    return YES;
}
//class-dump -H 捷报狂欢体育 -o CalculatorHeader


@end
