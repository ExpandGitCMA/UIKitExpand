#import "AppDelegate.h"
#import "AppDelegate+tabBar.h"
#import "LatelyMetodRouter.h"
#import <UMCommon/UMCommon.h>
#import "ALRouter.h"
#import <SVProgressHUD.h>
#import <AVOSCloud/AVOSCloud.h>
#import "SportsBallAppUrl.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [SVProgressHUD setMinimumDismissTimeInterval:2 ];

    
    //初始化 SDK
//    [AVOSCloud setApplicationId:APP_ID clientKey:APP_KEY];
    [AVOSCloud setApplicationId:APP_ID clientKey:APP_KEY serverURLString:API_URL];
    //开启调试日志
    [AVOSCloud setAllLogsEnabled:YES];
    
    [ALRouter loadConfigPlist:nil];
    [self  launchApptabBar];
    [UMConfigure initWithAppkey:UMAPP_Appkey channel:UMAPP_AppChannel];
    [LatelyMetodRouter  didFinishToVC];
    return YES;
}





@end
