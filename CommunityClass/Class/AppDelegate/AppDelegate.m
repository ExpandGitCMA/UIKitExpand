#import "AppDelegate.h"
#import "AppUrlprotocol.h"
#import "ColorHeaderRGBType.h"

@import Firebase;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self launchOptionsExtend];
    return YES;
}



-(void)launchOptionsExtend{
       [FIRApp configure];
       [SVProgressHUD setMinimumDismissTimeInterval:2 ];
        [[UITabBar appearance] setTintColor:kUIColorFromRGB(AppMianColor)];
        [[UINavigationBar appearance] setBarTintColor:kUIColorFromRGB(AppMianColor)];
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor], NSForegroundColorAttributeName,[UIFont fontWithName:@"PingFang-SC-Medium" size: 18], NSFontAttributeName, nil]];
       [[UITextField appearance] setTintColor:kUIColorFromRGB(AppMianColor)];
       [AVOSCloud setApplicationId:APP_ID clientKey:APP_KEY serverURLString:API_URL];
       [ALRouter loadConfigPlist:nil];
}


-(void)launchOptionsPushCenter:(NSString*)key{
   
}

@end
