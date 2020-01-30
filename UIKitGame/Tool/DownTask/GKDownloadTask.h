#import <Foundation/Foundation.h>
#import "BaseDownTask.h"
@interface GKDownloadTask : NSObject
+ (void)startDownTask:(BaseDownModel *)model
             progress:(void (^)(NSProgress *pro))progress
           completion:(void (^)(NSString *path,NSError *error))completion;
+ (void)pauseDownTask:(BaseDownModel *)model;
+ (void)deleteDownTask:(BaseDownModel *)model;
@end
