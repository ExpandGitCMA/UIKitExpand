#import "AppDelegate.h"
#import "AppDelegate+tabBar.h"
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
    [self  launchApptabBar];
    [AVOSCloud setApplicationId:APP_ID clientKey:APP_KEY serverURLString:API_URL];
    [ALRouter loadConfigPlist:nil];
    return YES;
}

-(void)registerPushWithKey:(NSString*)key{
    [UMConfigure initWithAppkey:key channel:UMAPP_AppChannel];
}

@end
