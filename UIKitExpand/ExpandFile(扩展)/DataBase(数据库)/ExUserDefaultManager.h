//
//  ExUserDefaultManager.h
//  UIKitExpand
//
//  Created by 童公放 on 2017/8/4.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpandUser.h"
@interface ExUserDefaultManager : NSObject
@property (nonatomic,readonly) ExpandUser *user;
+(instancetype)sharedDefaultManager;
- (void)saveAccount:(ExpandUser *)user;
- (void)removeAccount;
@end
