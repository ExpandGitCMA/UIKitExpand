//
//  YoBoDefault.h
//  UIKitExpand
//
//  Created by admin on 8/2/2020.
//  Copyright © 2020 ZeroSmell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YoBoLoginUser.h"
NS_ASSUME_NONNULL_BEGIN

@interface YoBoDefault : NSObject
@property (nonatomic,readonly) YoBoLoginUser *user;
+(instancetype)defaultUser;
- (void)keyedUser:(YoBoLoginUser *)user;
- (void)removeAccount;
+ (BOOL)isLogin;
+(NSArray*)getUsSource;
@end

NS_ASSUME_NONNULL_END
