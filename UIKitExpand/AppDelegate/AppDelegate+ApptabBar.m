//
//  AppDelegate+ApptabBar.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/11.
//  Copyright © 2017年 陈美安. All rights reserved.
//

#import "AppDelegate+ApptabBar.h"
#import "ExpandColorHeader.h"
@implementation AppDelegate (ApptabBar)


-(void)appDidLaunching{
    self.window.backgroundColor = [UIColor whiteColor];
    
    //tabBar文字颜色
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:233/255.0 green:84/255.0 blue:18/255.0 alpha:1]];
    
    //tabBar背景颜色 [[UITabBar appearance] setBarTintColor:[UIColor clearColor]];
    
    //导航栏背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor clearColor]];
    
    
    //导航栏背景图片
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"planBar.jpg"] forBarMetrics:UIBarMetricsDefault];
    
    //tabBar背景图片
//    [[UITabBar appearance]setBackgroundImage:[UIImage imageNamed:@"组-5"]];
    
    //导航栏按钮颜色 kUIColorFromRGB( ExStyle)
    [[UINavigationBar appearance] setTintColor:kUIColorFromRGB( ExStyle)];

    // 设置统一导航栏字体样式和颜色 [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor colorWithRed:233/255.0 green:84/255.0 blue:18/255.0 alpha:1], NSForegroundColorAttributeName,[UIFont fontWithName:@"PingFang-SC-Medium" size: 18], NSFontAttributeName, nil]];
    //系统的
    [[UIApplication sharedApplication]isStatusBarHidden];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
}

@end
