#import "YBSAppJumpConterl.h"
#import "YBSAppDelegate.h"
#import "YBSBaseNavigationController.h"

@implementation YBSAppJumpConterl


+(void)jumpBaserConterl{
    
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
