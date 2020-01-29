//
//  AcademicFinding.h
//  UIKitExpand
//
//  Created by 童公放 on 2017/8/4.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AcademicFinding : NSObject
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


