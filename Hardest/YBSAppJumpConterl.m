#import "YBSAppJumpConterl.h"
#import "YBSAppDelegate.h"
#import "YBSBaseNavigationController.h"
#import "YBSLaunchAnimationViewController.h"
#import "YBSHomeViewController.h"
#import "YBSYBSportsAlert.h"
@implementation YBSAppJumpConterl

+(void)jumpBaserConterl{
     __weak typeof(self) weakSelf = self;
    YBSLaunchAnimationViewController *launchAnimationVC = [[YBSLaunchAnimationViewController alloc] init];
    [[self class] toHomeViewConterl:launchAnimationVC];
    launchAnimationVC.animationFinish = ^{
        [[weakSelf class] EnteryBaseConterl];
    };
}

+(void)EnteryBaseConterl{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
       YBSBaseNavigationController *tabBar = (YBSBaseNavigationController *)[sb instantiateViewControllerWithIdentifier:@"RootNavigationController"];
    [[self class] toHomeViewConterl:tabBar];
}

+(void)loadPrivacyAlert{
     NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
     BOOL isNotFist = [userDefaults boolForKey:@"isNotFist"];
     if (isNotFist) {
            [[self class] EnteryBaseConterl];
      }else{
          [[self class] EnteryBaseConterl];
        YBSYBSportsAlert*sportsAlert = [YBSYBSportsAlert initYBSportsAlertWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) delegate:nil ];
         [sportsAlert setAnimationType:YBSportsAlertAnimationTypeDefault];
         YBSAppDelegate *appDelegate =  (YBSAppDelegate*)[[UIApplication sharedApplication] delegate];
        [sportsAlert YBSDCAlerAnimationConterl:appDelegate.window.rootViewController];
      }
}
+(void)toHomeViewConterl:(UIViewController*)controller{
    YBSAppDelegate *appDelegate =  (YBSAppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = controller;
    appDelegate.window.backgroundColor = [UIColor whiteColor];
    if (![appDelegate.window isKeyWindow]) {
        [appDelegate.window makeKeyAndVisible];
    }
}
@end
