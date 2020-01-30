//
//  GKPlayDataQueue.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/17.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKPlayDataQueue.h"
#import "BaseDataQueue.h"
static NSString *table = @"historyplay";
static NSString *primaryId = @"videoId";
@implementation GKPlayDataQueue
/**
 *  @brief 插入数据
 */
+ (void)insertDataToDataBase:(GKVideoModel *)model
                  completion:(void(^)(BOOL success))completion{
    [BaseDataQueue insertDataToDataBase:table primaryId:primaryId userInfo:[model modelToJSONObject] completion:completion];
}
/**
 *  @brief 数据更新
 */
+ (void)updateDataToDataBase:(GKVideoModel *)model
                  completion:(void(^)(BOOL success))completion{
    [BaseDataQueue updateDataToDataBase:table primaryId:primaryId userInfo:[model modelToJSONObject] completion:completion];
}
/**
 *  @brief 删除数据
 */
+ (void)deleteDataToDataBase:(NSString *)vid
                  completion:(void(^)(BOOL success))completion{
    [BaseDataQueue deleteDataToDataBase:table primaryId:primaryId primaryValue:vid completion:completion];
}
/**
 *  @brief 获取数据
 */
+ (void)getDataFromDataBase:(NSString *)vid
                 completion:(void(^)(GKVideoModel *model))completion{
    [BaseDataQueue getDataFromDataBase:table primaryId:primaryId primaryValue:vid completion:^(NSDictionary * _Nonnull dictionary) {
        GKVideoModel *model = [GKVideoModel modelWithJSON:dictionary];
        !completion ?: completion(model);
    }];
}
@end
