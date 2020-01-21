//
//  AppDelegate+JGPush.h
//  UIKitExpand
//
//  Created by Smell Zero on 2020/1/21.
//  Copyright © 2020 陈美安. All rights reserved.
//



#import "AppDelegate.h"

#import "JPUSHService.h"
// iOS10 注册 APNs 所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (JGPush)<JPUSHRegisterDelegate>
- (void)JGPushGisterNotification:(NSDictionary*)option;
@end

NS_ASSUME_NONNULL_END
