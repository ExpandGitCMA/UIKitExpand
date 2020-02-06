#import "AppDelegate.h"
#import "AppDelegate+tabBar.h"
#import "LatelyTechnicalPlain.h"
#import <UMCommon/UMCommon.h>
//com.Sports.OrgyBall  com.Sports.MutualOrgy
@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self  launchApptabBar];
    [UMConfigure initWithAppkey:@"5e3be0141dd6da21af9e579b" channel:@"App Store"];
    [LatelyTechnicalPlain  didFinishToVC];
    return YES;
}

@end


