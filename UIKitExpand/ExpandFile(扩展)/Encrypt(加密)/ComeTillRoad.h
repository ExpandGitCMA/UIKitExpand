//
//  ComeTillRoad.h
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/13.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RandomKey)
/**
 *  产生一个随机Key，长度为32.
 */
+ (NSString *)randomKey;
@end

@interface NSData (RandomData)
/**
 *  产生随机数据.
 *  @param length 随机数据的长度
 *
 */
+ (NSData *)randomDataWithLength:(NSUInteger)length;

@end


