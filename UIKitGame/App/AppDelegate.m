#import "AppDelegate.h"
#import "GKMenuViewController.h"
#import "GKHomeContentController.h"
#import "GKDeckController.h"
#import "GKTabBarController.h"
@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    GKTabBarController *center = [[GKTabBarController alloc] init];
    BaseNavigationController *left = [[BaseNavigationController alloc] initWithRootViewController:[GKMenuViewController new]];
    left.preferredContentSize = CGSizeMake(SCREEN_WIDTH*0.66, SCREEN_HEIGHT);
    GKDeckController *vc = [[GKDeckController alloc] initWithCenterViewController:center leftViewController:left];
    vc.panningEnabled = NO;
    self.window.rootViewController = vc;
    return YES;
}
- (UIInterfaceOrientationMask)application:(UIApplication*)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return self.makeOrientation == UIInterfaceOrientationLandscapeRight ? UIInterfaceOrientationMaskLandscapeRight:UIInterfaceOrientationMaskPortrait;;
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
