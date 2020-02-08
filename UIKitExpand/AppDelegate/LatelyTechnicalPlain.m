#import "LatelyTechnicalPlain.h"
#import "AppDelegate.h"
#import "BaseTabBarMetod.h"

@implementation LatelyTechnicalPlain
+(void)switchBaseTabBarController:(UIViewController*)controller{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    [[self class] pleasureoToControl:controller];
}
+(void)didFinishToVC{
    [[self class] showToController];
}
+(void)showToController{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    BaseTabBarMetod *tabBar = [[BaseTabBarMetod alloc]init];
    [[self class] pleasureoToControl:tabBar];
}
+(void)pleasureoToControl:(UIViewController*)controller{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = controller;
    appDelegate.window.backgroundColor = [UIColor whiteColor];
    if (![appDelegate.window isKeyWindow]) {
        [appDelegate.window makeKeyAndVisible];
    }
}
@end
