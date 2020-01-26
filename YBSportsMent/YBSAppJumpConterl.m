#import "YBSAppJumpConterl.h"
#import "YBSAppDelegate.h"
#import "YBSBaseNavigationController.h"
#import "YBSLaunchAnimationViewController.h"

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


+(void)toHomeViewConterl:(UIViewController*)controller{
    YBSAppDelegate *appDelegate =  (YBSAppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = controller;
    appDelegate.window.backgroundColor = [UIColor whiteColor];
    if (![appDelegate.window isKeyWindow]) {
        [appDelegate.window makeKeyAndVisible];
    }
}


@end
