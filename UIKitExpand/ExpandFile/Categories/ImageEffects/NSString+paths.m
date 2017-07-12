//
//  NSString+paths.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/11.
//  Copyright © 2017年 陈美安. All rights reserved.
//

#import "NSString+paths.h"

@implementation NSString (paths)

+(NSString*)pathsResourceName:(NSString*)name{
    return  [[NSBundle mainBundle] pathForResource:name ofType:nil];
}

@end
