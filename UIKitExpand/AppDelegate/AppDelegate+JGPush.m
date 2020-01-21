//
//  AppDelegate+JGPush.m
//  UIKitExpand
//
//  Created by Smell Zero on 2020/1/21.
//  Copyright © 2020 陈美安. All rights reserved.
//

#import "AppDelegate+JGPush.h"




#define PushKey @"33862abc26aa494d538f0795"
#define PushSecret @"8987e3b24417ccda46fbca2a"




@implementation AppDelegate (JGPush)


- (void)JGPushGisterNotification:(NSDictionary*)option{
    
    //notice: 3.0.0 及以后版本注册可以这样写，也可以继续用之前的注册方式
     JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    if (@available(iOS 12.0, *)) {
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|JPAuthorizationOptionProvidesAppNotificationSettings;
    } else {
        // Fallback on earlier versions
    }
     if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
       // 可以添加自定义 categories

     }
     [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
     [JPUSHService setupWithOption:option appKey:PushKey channel:@"app store" apsForProduction:0];
}


// APNs注册成功回调，将返回的deviceToken上传到CloudPush服务器
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    ///注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}


// APNs注册失败回调
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

// 打开／删除通知回调
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
     [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
     [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [JPUSHService handleRemoteNotification:userInfo];
}



#pragma mark - JPUSHRegisterDelegate


// iOS 12 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification API_AVAILABLE(ios(10.0)){
    if (@available(iOS 10.0, *)) {
        if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
            //从通知界面直接进入应用
            NSLog(@"start tongzhi to app");
        }else{
            //从通知设置界面进入应用
 
        }
    } else {
        // Fallback on earlier versions
    }
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}



// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler  API_AVAILABLE(ios(10.0)){
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if (@available(iOS 10.0, *)) {
        if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
            [JPUSHService handleRemoteNotification:userInfo];
        }
    } else {
        // Fallback on earlier versions
    }
     [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
}

// App处理收到通知(iOS 10+)

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler  API_AVAILABLE(ios(10.0)){
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if (@available(iOS 10.0, *)) {
        if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
            [JPUSHService handleRemoteNotification:userInfo];
        }
    } else {
        // Fallback on earlier versions
    }
     [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
     completionHandler();  // 系统要求执行这个方法
}


- (void)jpushNotificationAuthorization:(JPAuthorizationStatus)status withInfo:(NSDictionary *)info {
    
    NSLog(@"jpushNotificationAuthorization =%@",info);
}




@end
