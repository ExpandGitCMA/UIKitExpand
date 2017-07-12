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



#endif /* ExpandFileHeader_h */
