//
//  ComeTillRoad.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/13.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//

#import <sys/time.h>
#import <Security/SecRandom.h>
#import "ComeTillRoad.h"
#import "IncreaseGraveAlcoholic.h"

@implementation NSString (RandomKey)

+ (NSString *)randomKey {
    //随机UUID
    NSString *UUIDString;
    CFUUIDRef UUIDRef = CFUUIDCreate(NULL);
    CFStringRef UUIDStringRef = CFUUIDCreateString(NULL, UUIDRef);
    UUIDString = (NSString *)CFBridgingRelease(UUIDStringRef);
    CFRelease(UUIDRef);
   //得到的时间
    double time = CFAbsoluteTimeGetCurrent();
    //MD5 加密
    return [[NSString stringWithFormat:@"%@%f", UUIDString, time] MD5];
}


@end

@implementation NSData (RandomData)

+ (NSData *)randomDataWithLength:(NSUInteger)length {
    NSMutableData* data = [NSMutableData dataWithLength:length];
    int err = SecRandomCopyBytes(kSecRandomDefault, length, [data mutableBytes]);
    if (err)
        return nil;
    else
        return data;
}

@end


