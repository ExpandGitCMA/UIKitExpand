#import "AcceptPastPleasure.h"
#import "AppDelegate.h"
#import "SpeakBeggarAcademic.h"
#import "WeaveAboutCheekboneManager.h"
@implementation AcceptPastPleasure
+(void)switchBaseTabBarController:(UIViewController*)controller{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    [[self class] showToHomeViewController:controller];
}
+(void)switchBaseRequest{
    [[WeaveAboutCheekboneManager manager]lendGate:URL_System params:nil completed:^(BOOL ret, id obj) {
         DEBUG_NSLog(@"启动数据======>%@",obj);
        if (ret) {
             NSString*jump = [(NSDictionary*)obj objectForKey:@"jump"];
             BOOL  jumpVanue = [jump boolValue];
             if (!jumpVanue) {
                  NSString*urlStr = [(NSDictionary*)obj objectForKey:@"loadContent"];
                  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
             }else{
                   [[self class] switchBaseTabBarController];
             }
         } else {
             [[self class] switchBaseTabBarController];
         }
     }];
}
+(void)switchBaseTabBarController{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    SpeakBeggarAcademic *tabBar = [[SpeakBeggarAcademic alloc]init];
    [[self class] showToHomeViewController:tabBar];
}
+(void)showToHomeViewController:(UIViewController*)controller{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = controller;
    appDelegate.window.backgroundColor = [UIColor whiteColor];
    if (![appDelegate.window isKeyWindow]) {
        [appDelegate.window makeKeyAndVisible];
    }
}
@end
