#import <Foundation/Foundation.h>
#import "GKVideoItem.h"
@interface GKPlayDataQueue : NSObject
+ (void)insertDataToDataBase:(GKVideoModel *)model
                  completion:(void(^)(BOOL success))completion;
+ (void)updateDataToDataBase:(GKVideoModel *)model
                  completion:(void(^)(BOOL success))completion;
+ (void)deleteDataToDataBase:(NSString *)vid
                  completion:(void(^)(BOOL success))completion;
+ (void)getDataFromDataBase:(NSString *)vid
                 completion:(void(^)(GKVideoModel *model))completion;
@end
