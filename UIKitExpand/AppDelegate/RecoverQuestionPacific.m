#import "RecoverQuestionPacific.h"
#import "AppDelegate.h"
#import "AccountBeyondInsurance.h"
#import "NewsSportsTabBarVC.h"
#import "UncertainTransfusion.h"
@implementation RecoverQuestionPacific
+(void)switchBaseTabBarController:(UIViewController*)controller{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    [[self class] pleasureoToControl:controller];
}
+(void)getBaseRequestController{
    

      NSString  *seteid = [[UncertainTransfusion sharedDefaultManager]getApresentTimer];
      [[self class] speakToTabBarController:[seteid integerValue]];
}

+(void)speakToTabBarController:(NSInteger)index{
    
    UIViewController*tabBar;
    
    switch (index) {
        case 1:{
            tabBar = [AccountBeyondInsurance new];
        }
            
            break;
        case 2:{
            tabBar = [NewsSportsTabBarVC new];
        }break;
        default:
            break;
    }
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
