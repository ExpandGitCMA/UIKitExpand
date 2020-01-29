//
//  BendInformalProvince.h
//  UIKitExpand
// navbar
//  Created by 童公放 on 2017/8/3.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//   CJWNavBarStyle

#import <UIKit/UIKit.h>

//图片文字样式
typedef NS_ENUM(NSInteger, NavigationType){
    NavigationBarTextStyle   ,
    NavigationBarImageStyle  ,
};

//左右样式
typedef NS_ENUM(NSInteger, NavigationStyle){
    NavLeftStyle  ,
    NavRightStyle ,
};


@interface   UINavigationController (ExpandBar)
-(void)captureNavigationType:(NavigationType)type
             NavigationStyle:(NavigationStyle)style
                   barTarget:(id)target action:(SEL)action
                       title:(NSString*)title;
@end


