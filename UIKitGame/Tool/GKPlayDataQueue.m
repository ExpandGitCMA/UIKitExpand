#import "GKPlayDataQueue.h"
#import "BaseDataQueue.h"
static NSString *table = @"historyplay";
static NSString *primaryId = @"videoId";
@implementation GKPlayDataQueue
+ (void)insertDataToDataBase:(GKVideoModel *)model
                  completion:(void(^)(BOOL success))completion{
    [BaseDataQueue insertDataToDataBase:table primaryId:primaryId userInfo:[model modelToJSONObject] completion:completion];
}
+ (void)updateDataToDataBase:(GKVideoModel *)model
                  completion:(void(^)(BOOL success))completion{
    [BaseDataQueue updateDataToDataBase:table primaryId:primaryId userInfo:[model modelToJSONObject] completion:completion];
}
+ (void)deleteDataToDataBase:(NSString *)vid
                  completion:(void(^)(BOOL success))completion{
    [BaseDataQueue deleteDataToDataBase:table primaryId:primaryId primaryValue:vid completion:completion];
}
+ (void)getDataFromDataBase:(NSString *)vid
                 completion:(void(^)(GKVideoModel *model))completion{
    [BaseDataQueue getDataFromDataBase:table primaryId:primaryId primaryValue:vid completion:^(NSDictionary * _Nonnull dictionary) {
        GKVideoModel *model = [GKVideoModel modelWithJSON:dictionary];
        !completion ?: completion(model);
    }];
}
@end
