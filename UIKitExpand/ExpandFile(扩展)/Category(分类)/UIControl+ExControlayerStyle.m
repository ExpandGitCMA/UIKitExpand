//
//  UIControl+ExControlayerStyle.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/14.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
// CJWControlayerStyle

#import "UIControl+ExControlayerStyle.h"

@implementation UIControl (ExControlayerStyle)

-(void)searchNormalStyle{
    self.layer.cornerRadius=14.0f;
    self.layer.masksToBounds=YES;
    self.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor clearColor]);
    self.layer.borderWidth= 1.0f;
}
@end


