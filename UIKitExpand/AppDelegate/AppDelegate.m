#import "AppDelegate.h"
#import "AppDelegate+tabBar.h"
#import "LatelyMetodRouter.h"
#import <UMCommon/UMCommon.h>
#import "ALRouter.h"
#import <SVProgressHUD.h>


@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [SVProgressHUD setMinimumDismissTimeInterval:2 ];

    [ALRouter loadConfigPlist:nil];
    [self  launchApptabBar];
    [UMConfigure initWithAppkey:@"5e3e5e1f4ca357829b000099" channel:@"App Store"];
    [LatelyMetodRouter  didFinishToVC];
    return YES;
}





@end
