//
//  AppDelegate.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/11.
//  Copyright © 2017年 陈美安. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+ApptabBar.h"
#import "AppEnteryConterl.h"
#import "ExpandFileHeader.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    [self appDidLaunching];
    [AppEnteryConterl  appDidLaunchController];

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
