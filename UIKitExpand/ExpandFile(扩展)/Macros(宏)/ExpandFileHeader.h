//
//  ExpandFileHeader.h
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/12.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//

#ifndef ExpandFileHeader_h
#define ExpandFileHeader_h
#import "Safety.h"
#import "EXTScope.h"
#import "ExpandRequest_Url.h"

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


#ifdef DEBUG
#define DEBUG_NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define DEBUG_NSLog(format, ...)

#endif
#endif /* ExpandFileHeader_h */
