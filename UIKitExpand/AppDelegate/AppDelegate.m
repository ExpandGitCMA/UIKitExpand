//
//  AppDelegate.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/11.
//  Copyright © 2017年 陈美安. All rights reserved.
//     解决OCR:iOS身份证（正反面）识别及银行卡识别 报错 https://blog.csdn.net/tiantianios/article/details/82112660

#import "AppDelegate.h"
#import "AppDelegate+ApptabBar.h"
#import "AppEnteryConterl.h"
#import "ExpandFileHeader.h"
#import "ExpandUser.h"
#import "ExUserDefaultManager.h"

#include "exbankcard.h"
#include "excards.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self appDidLaunching];
    [AppEnteryConterl  switchBaseTabBarController];

     ExpandUser*user = [ExpandUser userWithDict:nil];
     [[ExUserDefaultManager sharedDefaultManager]saveAccount:user];
    
    unsigned char result [512];
    int resultLen = BankCardNV12(result, 512, 0, 0, 0, 0, 0, 0, 0, 0);
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
   
}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}

#pragma mark 是否支持横屏
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    if (ISIPADIDIOM) {
        return UIInterfaceOrientationMaskLandscape;
    }
    return UIInterfaceOrientationMaskPortrait;
}
@end
