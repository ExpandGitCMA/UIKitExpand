#import "AcceptPastPleasure.h"
#import "AppDelegate.h"
#import "SpeakBeggarAcademic.h"
#import "WeaveAboutCheekboneManager.h"
@implementation AcceptPastPleasure
+(void)switchBaseTabBarController:(UIViewController*)controller{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    [[self class] pleasureoToControl:controller];
}
+(void)getBaseRequestController{
    [[self class] speakToTabBarController];
}
+(void)speakToTabBarController{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    SpeakBeggarAcademic *tabBar = [[SpeakBeggarAcademic alloc]init];
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
