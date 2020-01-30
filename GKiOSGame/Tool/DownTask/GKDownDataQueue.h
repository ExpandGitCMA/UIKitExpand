//
//  GKDownDataQueue.h
//  GKiOSDownload
//
//  Created by wangws1990 on 2019/7/4.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDownTask.h"
#import "BaseDataQueue.h"


@interface GKDownDataQueue : NSObject
+ (void)insertDataToDataBase:(BaseDownModel *)model
                  completion:(void(^)(BOOL success))completion;
/**
 *  @brief 删除数据
 */
+ (void)deleteDataToDataBase:(NSString *)downId
                  completion:(void(^)(BOOL success))completion;

/**
 *  @brief 获取数据
 */
+ (void)getDataFromDataBase:(NSString *)downId
                 completion:(void(^)(BaseDownModel *model))completion;
+ (void)getDatasFromDataBase:(GKDownTaskState)state
                  completion:(void(^)(NSArray <BaseDownModel *>*listData))completion;
+ (void)getDatasFromDataBase:(void(^)(NSArray <BaseDownModel *>*listData))completion;
@end


