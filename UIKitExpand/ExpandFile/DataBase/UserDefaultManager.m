//
//  UserDefaultManager.m
//  UIKitExpand
//
//  Created by admin on 8/2/2020.
//  Copyright © 2020 ZeroSmell. All rights reserved.
//

#import "UserDefaultManager.h"

static UserDefaultManager *userManager = nil;

@implementation UserDefaultManager

- (id)copyWithZone:(NSZone *)zone {
    return [[UserDefaultManager allocWithZone:zone] init];
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
- (void)saveAccount:(User *)user{
    _user = user;
     [NSKeyedArchiver archiveRootObject:user toFile:[self cacheDir]];
}

//文件存储路径
- (NSString *)cacheDir{
    NSString *addressPath=[NSString stringWithFormat:@"%@/%@",[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject],@"User.data"];
    NSLog(@"%@",addressPath);
    return addressPath;
}

- (void)removeAccount{
    if( [[NSFileManager defaultManager] fileExistsAtPath:[self cacheDir]]){
        [[NSFileManager defaultManager] removeItemAtPath:[self cacheDir] error:nil];
    }
    _user = nil;
}

+ (BOOL)isLogin{
    User *user =  [UserDefaultManager sharedDefaultManager].user ;
    if (user.token && user.token.length > 0 && user.uid != nil) {
        return YES;
    }
    return NO;
}
@end
