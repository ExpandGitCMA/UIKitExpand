//
//  ExpandFileHeader.h
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/12.
//  Copyright © 2017年 陈美安. All rights reserved.
//

#ifndef ExpandFileHeader_h
#define ExpandFileHeader_h
//如果不是iPhone的视图，就采用iPad的显示方式，包括apple TV
#define ISIPADIDIOM ([UIDevice currentDevice].userInterfaceIdiom != UIUserInterfaceIdiomPhone)

//设备主屏宽高
#define SCREEN_WIDTH ([UIScreen  mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//是否iOS8以下
#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] <8.0 ? YES : NO)
//是否iOS9以下
#define iOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] <9.0 ? YES : NO)
//是否iOS9以上
#define iOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0 ? YES : NO)
//是否iOS10以上
#define iOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 ? YES : NO)

//是否从右到左
#define ISRIGHTTOLEFT  (iOS9 && [UIView instancesRespondToSelector:@selector(semanticContentAttribute)] && ([UIView appearance].semanticContentAttribute == UISemanticContentAttributeForceRightToLeft))

#endif /* ExpandFileHeader_h */
