#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface GKVideoNetManager : NSObject
+ (NSURLSessionDataTask *)videoId:(NSString *)videoId
                             page:(NSInteger)page
                          success:(void(^)(id object))success
                          failure:(void(^)(NSString *error))failure;
@end
NS_ASSUME_NONNULL_END
