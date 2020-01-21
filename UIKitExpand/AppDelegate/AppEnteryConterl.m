//
//  AppEnteryConterl.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/12.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//

#import "AppEnteryConterl.h"
#import "AppDelegate.h"

@implementation AppEnteryConterl

+(void)switchBaseTabBarController:(UIViewController*)controller{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    [[self class] showToHomeViewController:controller];
}

+(void)switchBaseTabBarController{
//    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
//    appDelegate.window.rootViewController = nil;
//    BaseTabBarCtrl *tabBar = [[BaseTabBarCtrl alloc]init];
//    [[self class] showToHomeViewController:tabBar];
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
