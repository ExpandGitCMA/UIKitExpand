#import "LatelyMetodRouter.h"
#import "AppDelegate.h"
#import "BaseTabBarMetod.h"
#import "ALRouter.h"

@implementation LatelyMetodRouter


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


#pragma mark-隐私协议跳转
+(void)switchTopushUserPrivacyVC:(UIViewController*)controller{
    [controller.navigationController pushViewController:[ALRouter openURL:@"UserPrivacy"] animated:YES];
}

#pragma mark-意见反馈跳转
+(void)switchTopushFeedbackMetodVC:(UIViewController*)controller{
    [controller.navigationController pushViewController:[ALRouter openURL:@"FeedbackMetod"] animated:YES];
}
#pragma mark-关于我们跳转
+(void)switchTopushAboutUsMetodVC:(UIViewController*)controller{
    [controller.navigationController pushViewController:[ALRouter openURL:@"AboutUsMetod"] animated:YES];
}

#pragma mark-登陆跳转
+(void)switchTopresentLoginMetodVC:(UIViewController*)controller{
    
    UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:[ALRouter openURL:@"LoginMetod" withParams:@{}]];
    [controller presentViewController:navc animated:YES completion:nil];
   
}

#pragma mark-注册跳转
+(void)switchTopresentRegisterMetodVC:(UIViewController*)controller{
    
    UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:[ALRouter openURL:@"RegisterMetod" withParams:@{}]];
    [controller presentViewController:navc animated:YES completion:nil];
   
}

+(void)switchTopushMessAgeMetodVC:(UIViewController*)controller{
    [controller.navigationController pushViewController:[ALRouter openURL:@"MessAgeMetod"] animated:YES];
}

+(void)switchTopushUsSystemVC:(UIViewController*)controller{
    [controller.navigationController pushViewController:[ALRouter openURL:@"UsSystem"] animated:YES];
}

+(void)switchTopushPostedMetodVC:(UIViewController*)controller{
    [controller.navigationController pushViewController:[ALRouter openURL:@"PostedMetod"] animated:YES];
}



@end