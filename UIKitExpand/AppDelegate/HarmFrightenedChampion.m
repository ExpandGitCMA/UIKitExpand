#import "HarmFrightenedChampion.h"
#import "AppDelegate.h"
#import "VastAgent.h"
#import "CopyManmadeCatastropheManager.h"
@implementation HarmFrightenedChampion
+(void)switchBaseTabBarController:(UIViewController*)controller{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    [[self class] pleasureoToControl:controller];
}
+(void)didFinishToVC{
    [[self class] speakToTabBarController];
}
+(void)speakToTabBarController{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    VastAgent *tabBar = [[VastAgent alloc]init];
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
