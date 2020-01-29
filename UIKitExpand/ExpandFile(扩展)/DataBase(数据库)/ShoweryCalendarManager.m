//
//  ShoweryCalendarManager.m
//  UIKitExpand
//
//  Created by 童公放 on 2017/8/4.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//

#import "ShoweryCalendarManager.h"


static ShoweryCalendarManager *userManager = nil;

@implementation ShoweryCalendarManager


- (id)copyWithZone:(NSZone *)zone {
    return [[ShoweryCalendarManager allocWithZone:zone] init];
}
+ (id)allocWithZone:(NSZone *)zone{
    return [self sharedDefaultManager];
}

+(instancetype)sharedDefaultManager{
    static dispatch_once_t dispatch;
    dispatch_once(&dispatch , ^{
        if (!userManager) {
            userManager = [[super allocWithZone:NULL] init];
         }
    });
    return userManager;
}

//解码数据
- (instancetype)init{
    if (self = [super init]) {
        _user = [NSKeyedUnarchiver unarchiveObjectWithFile:[self cacheDir]];
    }
    return self;
}

//保存数据
- (void)glideWithinWrongLeak:(AcademicFinding *)user{
    _user = user;
     [NSKeyedArchiver archiveRootObject:user toFile:[self cacheDir]];
}

//文件存储路径
- (NSString *)cacheDir{
    NSString *addressPath=[NSString stringWithFormat:@"%@/%@",[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject],@"AcademicFinding.data"];
    NSLog(@"%@",addressPath);
    return addressPath;
}

- (void)searchBruise{
    if( [[NSFileManager defaultManager] fileExistsAtPath:[self cacheDir]]){
        [[NSFileManager defaultManager] removeItemAtPath:[self cacheDir] error:nil];
    }
    _user = nil;
}
@end


