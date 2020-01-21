//
//  AES.h
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/13.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES)
/**
 *  AES_256_CBC_PKCS7Padding+HMAC, 加密后输出的格式为IV+AES密文+SHA256+Salt
 */
- (NSData *)AES256EncryptWithKey:(NSString *)key;
- (NSData *)AES256DecryptWithKey:(NSString *)key;
@end

@interface NSString (AES)

//加密
- (NSString *)AES256EncryptWithKey:(NSString *)key;
//解密
- (NSString *)AES256DecryptWithKey:(NSString *)key;

@end
