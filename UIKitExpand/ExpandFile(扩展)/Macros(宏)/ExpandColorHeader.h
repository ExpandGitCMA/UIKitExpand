//
//  ExpandColorHeader.h
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/12.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//

#ifndef ExpandColorHeader_h
#define ExpandColorHeader_h

#import <Foundation/Foundation.h>

//RGB 转换 色值码 
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


typedef NS_ENUM(UInt32, ColorRGBType) {
    AppMianColor             = 0x489EFF,
    ExSearch                 = 0Xf2f2f2,
    ExAddress                = 0x999999,
    ExStyle                  = 0x81858c,
};


#endif /* ExpandColorHeader_h */
