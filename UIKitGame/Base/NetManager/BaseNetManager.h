#import "BaseNetTool.h"
#import "BaseNetModel.h"
@interface BaseNetManager : NSObject
+ (NSURLSessionDataTask *)method:(HttpMethod)method
                       urlString:(NSString *)urlString
                          params:(NSDictionary *)params
                         success:(void(^)(id object))success
                         failure:(void(^)(NSString *error))failure;
+ (NSURLSessionDataTask *)method:(HttpMethod)method
                       urlString:(NSString *)urlString
                          params:(NSDictionary *)params
                           cache:(BOOL)cache
                         success:(void(^)(id object))success
                         failure:(void(^)(NSString *error))failure;
+ (NSURLSessionDataTask *)method:(HttpMethod)method
                      serializer:(HttpSerializer)serializer
                       urlString:(NSString *)urlString
                          params:(NSDictionary *)params
                         timeOut:(NSTimeInterval)timeOut
                         success:(void(^)(id object))success
                         failure:(void(^)(NSString *error))failure;
@end
