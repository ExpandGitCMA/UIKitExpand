//
//  HttpRequestManager.h
//  UIKitExpand
//
//  Created by 童公放 on 2017/8/4.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "ExpandFileHeader.h"

typedef void (^HttpCompletedBlock)(BOOL ret, id obj);

@interface HttpRequestManager : AFHTTPSessionManager
+ (instancetype)sharedManager;
//PSOT 请求
- (void)requestPostWithPath:(NSString *)path params:(NSMutableDictionary *)params completed:(HttpCompletedBlock)completed;
//GET请求
- (void)requestGetWithPath:(NSString *)path params:(NSMutableDictionary *)params completed:(HttpCompletedBlock)completed;

@end
