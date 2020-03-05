#import "AppDelegate.h"
#import "AppDelegate+ApptabBar.h"
#import <SVProgressHUD.h>
#import <AVOSCloud/AVOSCloud.h>
#import "YaBoTabBarVC.h"

@import Firebase;

@interface AppDelegate ()
@end

@implementation AppDelegate

#define APP_ID @"V6K88SW7GnwJLtxPevtV8s9l-gzGzoHsz"
#define APP_KEY @"7gazdQAWsTWuutxNHDXn9s9L"
#define API_URL @"https://v6k88sw7.lc-cn-n1-shared.com"


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self launch];
    [FIRApp configure];
    [SVProgressHUD setMinimumDismissTimeInterval:2 ];
    [AVOSCloud setApplicationId:APP_ID clientKey:APP_KEY serverURLString:API_URL];
    return YES;
}

-(void)registerPushWithKey:(NSString*)key{

     YaBoTabBarVC *tabBar = [[YaBoTabBarVC alloc]init];
     self.window.rootViewController = tabBar ;
}

@end
