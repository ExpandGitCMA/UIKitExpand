#import "AppDelegate.h"
#import "AppUrlprotocol.h"
#import "ColorHeaderRGBType.h"
#import "BaseTabBarMetod.h"
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
    
          // 构建对象
      //    AVObject *todo = [AVObject objectWithClassName:@"Todo"];
      //
      //    // 为属性赋值
      //    [todo setObject:@"1" forKey:@"type"];
      //    [todo setObject:@"success" forKey:@"msg"];
      //    [todo setObject:@"2020-03-05" forKey:@"time"];
      //    [todo setObject:@"https://www.baidu.com" forKey:@"address"];
      //
      //    // 将对象保存到云端
      //    [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
      //        if (succeeded) {
      //            // 成功保存之后，执行其他逻辑
      //            NSLog(@"保存成功。objectId：%@", todo.objectId);
      //        } else {
      //            // 异常处理
      //        }
      //    }];
}


-(void)launchOptionsPushCenter:(NSString*)key{
   
    self.window.rootViewController = [BaseTabBarMetod new];
}

@end
