//
//  UserDefaultManager.h
//  UIKitExpand
//
//  Created by admin on 8/2/2020.
//  Copyright © 2020 ZeroSmell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserDefaultManager : NSObject
@property (nonatomic,readonly) User *user;
+(instancetype)sharedDefaultManager;
- (void)saveAccount:(User *)user;
- (void)removeAccount;
+ (BOOL)isLogin;
@end

NS_ASSUME_NONNULL_END
