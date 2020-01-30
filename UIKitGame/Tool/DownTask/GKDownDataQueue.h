#import <Foundation/Foundation.h>
#import "BaseDownTask.h"
#import "BaseDataQueue.h"
@interface GKDownDataQueue : NSObject
+ (void)insertDataToDataBase:(BaseDownModel *)model
                  completion:(void(^)(BOOL success))completion;
+ (void)deleteDataToDataBase:(NSString *)downId
                  completion:(void(^)(BOOL success))completion;
+ (void)getDataFromDataBase:(NSString *)downId
                 completion:(void(^)(BaseDownModel *model))completion;
+ (void)getDatasFromDataBase:(GKDownTaskState)state
                  completion:(void(^)(NSArray <BaseDownModel *>*listData))completion;
+ (void)getDatasFromDataBase:(void(^)(NSArray <BaseDownModel *>*listData))completion;
@end
