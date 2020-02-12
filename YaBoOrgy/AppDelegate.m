#import "AppDelegate.h"
#import "AppDelegate+ApptabBar.h"
#import <UMCommon/UMCommon.h>
#import <SVProgressHUD.h>
#import <AVOSCloud/AVOSCloud.h>


@interface AppDelegate ()
@end

@implementation AppDelegate

#define APP_ID @"V6K88SW7GnwJLtxPevtV8s9l-gzGzoHsz"
#define APP_KEY @"7gazdQAWsTWuutxNHDXn9s9L"
#define API_URL @"https://v6k88sw7.lc-cn-n1-shared.com"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self launchAppAppearance];
    [SVProgressHUD setMinimumDismissTimeInterval:2 ];
    [AVOSCloud setApplicationId:APP_ID clientKey:APP_KEY serverURLString:API_URL];
    return YES;
}

-(void)registerPushWithKey:(NSString*)key{
     [UMConfigure initWithAppkey:@"5e3a3feda904a9297aeefed1" channel:@"App Store"];
}
@end
