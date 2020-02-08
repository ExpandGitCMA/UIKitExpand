//
//  User.h
//  UIKitExpand
//
//  Created by admin on 8/2/2020.
//  Copyright © 2020 陈美安. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject
@property (nonatomic,copy) NSString *imgUrl; // 头像
@property (nonatomic,copy) NSString *name;  //  姓名
@property (nonatomic,copy) NSString *mobile;    // 手机号
@property (nonatomic,copy) NSString *sex;   // 性别
@property (nonatomic,copy) NSString *createDate;    // 创建时间
@property (nonatomic,copy) NSString *userCode;   // 账号
@property (nonatomic,copy) NSString *userId;    // 用户id
@property (nonatomic,copy) NSString *userToken; // token
+ (instancetype)userWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
