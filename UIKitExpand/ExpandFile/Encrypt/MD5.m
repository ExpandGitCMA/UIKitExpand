//
//  MD5.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/13.
//  Copyright © 2017年 陈美安. All rights reserved.
//

#import "MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (MD5)

- (NSString*)MD5 {
    //创建无符号字符的字节数组
    unsigned char  md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    //创建16字节MD5哈希值，存储在缓冲区中
    CC_MD5([self bytes], (uint32_t)[self length], md5Buffer);
    
    // 转换为unsigned char缓冲NSString值
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    return output;
    
}
@end

@implementation NSString (MD5)

- (NSString *)MD5 {
    //创建的字符串指针为 UTF8
    const char *ptr = [self UTF8String];
    
    // 创建无符号字符的字节数组
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // 创建16字节MD5哈希值，存储在缓冲区中
    CC_MD5(ptr, (uint32_t)strlen(ptr), md5Buffer);
    
    // 转换为unsigned char缓冲NSString值
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    return output;
}

@end
