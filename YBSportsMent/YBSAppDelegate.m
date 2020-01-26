#import "YBSAppDelegate.h"
#import "YBSLaunchAnimationViewController.h"
#import "YBSBaseNavigationController.h"
#import "YBSResultViewController.h"
#import "YBSStageInfoManager.h"
#import "YBSStageInfo.h"
@interface YBSAppDelegate ()
@end
@implementation YBSAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   // [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [NSThread sleepForTimeInterval:1.0];
    [self setKeyWindow];
    return YES;
}
- (void)setKeyWindow {
    __weak typeof(self) weakSelf = self;
    YBSLaunchAnimationViewController *launchAnimationVC = [[YBSLaunchAnimationViewController alloc] init];
    launchAnimationVC.animationFinish = ^{
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        YBSBaseNavigationController *rootNav = (YBSBaseNavigationController *)[sb instantiateViewControllerWithIdentifier:@"RootNavigationController"];
        weakSelf.window.rootViewController = rootNav;
    };
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = launchAnimationVC;
    [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application {
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
}
- (void)applicationWillTerminate:(UIApplication *)application {
}
@end
