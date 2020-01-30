#import "GKDownDataQueue.h"
static NSString *downTable = @"downTable";
static NSString *downTableId = @"downId";
@implementation GKDownDataQueue
+ (void)insertDataToDataBase:(BaseDownModel *)model
                  completion:(void(^)(BOOL success))completion{
    NSMutableDictionary *dic = @{}.mutableCopy;
    [dic addEntriesFromDictionary:[model modelToJSONObject]];
    dic[@"resumeData"] = model.resumeData ?:@"";
    [BaseDataQueue insertDataToDataBase:downTable primaryId:downTableId userInfo:dic.copy completion:completion];
}
+ (void)deleteDataToDataBase:(NSString *)downId
                  completion:(void(^)(BOOL success))completion{
    [BaseDataQueue deleteDataToDataBase:downTable primaryId:downTableId primaryValue:downId completion:completion];
}
+ (void)getDataFromDataBase:(NSString *)downId
                 completion:(void(^)(BaseDownModel *model))completion{
    [BaseDataQueue getDataFromDataBase:downTable primaryId:downTableId primaryValue:downId completion:^(NSDictionary * _Nonnull dictionary) {
        !completion ?: completion([BaseDownModel modelWithJSON:dictionary]);
    }];
}
+ (void)getDatasFromDataBase:(GKDownTaskState)state
                  completion:(void(^)(NSArray <BaseDownModel *>*listData))completion{
    [GKDownDataQueue getDatasFromDataBase:^(NSArray<BaseDownModel *> *listData) {
        NSMutableArray *datas = [[NSMutableArray alloc] init];
        [listData enumerateObjectsUsingBlock:^(BaseDownModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.state == state) {
                [datas addObject:obj];
            }
        }];
        !completion ?: completion(datas);
    }];
}
+ (void)getDatasFromDataBase:(void(^)(NSArray <BaseDownModel *>*listData))completion{
    [BaseDataQueue getDatasFromDataBase:downTable primaryId:downTableId completion:^(NSArray<NSDictionary *> * _Nonnull listData) {
        NSArray *datas = [NSArray modelArrayWithClass:BaseDownModel.class json:listData];
        !completion ?: completion(datas);
    }];
}
@end
