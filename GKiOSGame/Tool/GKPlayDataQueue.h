//
//  GKPlayDataQueue.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/17.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKVideoItem.h"

@interface GKPlayDataQueue : NSObject
/**
 *  @brief 插入数据
 */
+ (void)insertDataToDataBase:(GKVideoModel *)model
                  completion:(void(^)(BOOL success))completion;
/**
 *  @brief 数据更新
 */
+ (void)updateDataToDataBase:(GKVideoModel *)model
                  completion:(void(^)(BOOL success))completion;
/**
 *  @brief 删除数据
 */
+ (void)deleteDataToDataBase:(NSString *)vid
                  completion:(void(^)(BOOL success))completion;
/**
 *  @brief 获取数据
 */
+ (void)getDataFromDataBase:(NSString *)vid
                 completion:(void(^)(GKVideoModel *model))completion;
@end

