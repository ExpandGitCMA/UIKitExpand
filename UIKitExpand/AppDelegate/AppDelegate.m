#import "AppDelegate.h"
#import "AppDelegate+tabBar.h"
#import "LatelyTechnicalPlain.h"
//com.Sports.OrgyBall  com.Sports.MutualOrgy
@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self  launchApptabBar];
    [LatelyTechnicalPlain  didFinishToVC];
    return YES;
}

@end


