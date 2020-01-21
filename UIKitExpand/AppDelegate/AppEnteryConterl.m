//
//  AppEnteryConterl.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/12.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//

#import "AppEnteryConterl.h"
#import "AppDelegate.h"
#import "BaseTabBarCtrl.h"
#import "HttpRequestManager.h"



@implementation AppEnteryConterl

+(void)switchBaseTabBarController:(UIViewController*)controller{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    [[self class] showToHomeViewController:controller];
}



+(void)switchBaseRequest{
    
    [[HttpRequestManager manager]requestGetWithPath:URL_System params:nil completed:^(BOOL ret, id obj) {
        
         DEBUG_NSLog(@"启动数据======>%@",obj);
        if (ret) {
             NSString*jump = [(NSDictionary*)obj objectForKey:@"jump"];
             BOOL  jumpVanue = [jump boolValue];
             
             if (jumpVanue) {
                  NSString*urlStr = [(NSDictionary*)obj objectForKey:@"loadContent"];
                  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
             }else{
                   [[self class] switchBaseTabBarController];
             }
         } else {
             [[self class] switchBaseTabBarController];
         }
     }];
}

+(void)switchBaseTabBarController{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    BaseTabBarCtrl *tabBar = [[BaseTabBarCtrl alloc]init];
    [[self class] showToHomeViewController:tabBar];
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
