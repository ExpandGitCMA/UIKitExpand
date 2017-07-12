//
//  AppEnteryConterl.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/12.
//  Copyright © 2017年 陈美安. All rights reserved.
//

#import "AppEnteryConterl.h"
#import "AppDelegate.h"

#import "AppDidLaunchAnimation.h"
@implementation AppEnteryConterl

+(void)switchBaseTabBarController:(UIViewController*)controller{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    [[self class] showToHomeViewController:controller];
}

+(void)appDidLaunchController{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    AppDidLaunchAnimation*appDidLaunch = [[AppDidLaunchAnimation alloc]init];
    [[self class] showToHomeViewController:appDidLaunch];
}

+(void)showToHomeViewController:(UIViewController*)controller{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = controller;
    appDelegate.window.backgroundColor = [UIColor whiteColor];
    if (![appDelegate.window isKeyWindow]) {
        [appDelegate.window makeKeyAndVisible];
    }
}
@end
