#import "AppDelegate.h"
#import "AppDelegate+tabBar.h"
#import "LatelyTechnicalPlain.h"
#import <UMCommon/UMCommon.h>
#import <UMAnalytics/MobClick.h>
#import <UMShare/UMShare.h>



@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self  launchApptabBar];
    [UMConfigure initWithAppkey:@"5e3e5e1f4ca357829b000099" channel:@"App Store"];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx62f88a2e48ecb755" appSecret: @"5edf945faefdb83c76bdf8a6d0ed61da" redirectURL:nil];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1108842614"  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
    [UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
    [LatelyTechnicalPlain  didFinishToVC];
    return YES;
}
@end
