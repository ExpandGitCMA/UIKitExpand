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
    [[UITabBar appearance] setTintColor:kUIColorFromRGB(ExpandIconColor)];
    [[UINavigationBar appearance] setBarTintColor:kUIColorFromRGB(ExpandIconColor)];
    
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor], NSForegroundColorAttributeName,[UIFont fontWithName:@"PingFang-SC-Medium" size: 18], NSFontAttributeName, nil]];
    //系统的
    [[UIApplication sharedApplication]isStatusBarHidden];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
}

@end
