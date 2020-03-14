#import "AppDelegate.h"
#import <AVOSCloud/AVOSCloud.h>
#import <Firebase.h>


#import "ColorHeaderRGBType.h"
#import "AppHomeMain.h"
@interface AppDelegate ()

@end



@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
     [AVOSCloud setApplicationId:APP_ID clientKey:APP_KEY serverURLString:API_URL];
     [FIRApp configure];
     [self setAppTintColor];
     //地址 https://www.leancloud.cn
//    AVObject *todo = [AVObject objectWithClassName:@"Giwotis"];
//
//           // 为属性赋值
//           [todo setObject:@"1.1"        forKey:@"version"];
//           [todo setObject:@"GIWOTIS" forKey:@"bundle_name"];
//           [todo setObject:@"GISC07ZP02YJUISYVX" forKey:@"uid"];
//           [todo setObject:@"DB201TWED770EB996" forKey:@"token"];
//           [todo setObject:@"success" forKey:@"msg"];
//       
//           // 将对象保存到云端
//           [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//               if (succeeded) {
//                   // 成功保存之后，执行其他逻辑
//                   NSLog(@"保存成功。objectId：%@", todo.objectId);
//               } else {
//                   // 异常处理
//               }
//           }];
    
     return YES;
}


-(void)setAppTintColor{
       [[UITabBar appearance] setTintColor:kUIColorFromRGB(AppMianColor)];
       [[UINavigationBar appearance] setBarTintColor:kUIColorFromRGB(AppMianColor)];
       [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
       [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor], NSForegroundColorAttributeName,[UIFont fontWithName:@"PingFang-SC-Medium" size: 18], NSFontAttributeName, nil]];
      [[UITextField appearance] setTintColor:kUIColorFromRGB(AppMianColor)];
}


-(void)registerPushWithKey:(NSDictionary*)initialProps{

    UIStoryboard *story = [UIStoryboard storyboardWithName:@"AppHomeMain" bundle:nil];
    UINavigationController *rootViewController = [[UINavigationController alloc]initWithRootViewController:[story instantiateViewControllerWithIdentifier:@"HomeMain"]];
    self.window.rootViewController = rootViewController;
}


@end
