#import <Foundation/Foundation.h>
#import "GKHomeModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface GKHomeNetManager : NSObject
+ (NSURLSessionDataTask *)home:(GKHomeItem *)item
                          page:(NSInteger)page
                       success:(void(^)(id object))success
                       failure:(void(^)(NSString *error))failure;
+ (NSURLSessionDataTask *)wallDetail:(NSString *)vid
                             success:(void(^)(id object))success
                             failure:(void(^)(NSString *error))failure;
+ (NSURLSessionDataTask *)detail:(NSString *)action
                          newsId:(NSString *)newsId
                         success:(void(^)(id object))success
                         failure:(void(^)(NSString *error))failure;
+ (NSURLSessionDataTask *)hotVideo:(NSString *)action
                               src:(NSString *)src
                               tag:(NSString *)tag
                              page:(NSInteger)page
                           success:(void(^)(id object))success
                           failure:(void(^)(NSString *error))failure;
+ (NSURLSessionDataTask *)videoPlay:(NSString *)action
                                vid:(NSString *)vid
                            success:(void(^)(id object))success
                            failure:(void(^)(NSString *error))failure;
+ (NSURLSessionDataTask *)classify:(NSString *)action
                               src:(NSString *)src
                           success:(void(^)(id object))success
                           failure:(void(^)(NSString *error))failure;
+ (NSURLSessionDataTask *)wall:(NSString *)albumsTag
                        action:(NSString *)action
                          page:(NSInteger)page
                       success:(void(^)(id object))success
                       failure:(void(^)(NSString *error))failure;
+ (NSURLSessionDataTask *)wallDetail:(NSString *)albumId
                              action:(NSString *)action
                             success:(void(^)(id object))success
                             failure:(void(^)(NSString *error))failure;
@end
NS_ASSUME_NONNULL_END
