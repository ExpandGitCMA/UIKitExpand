#import <Foundation/Foundation.h>
#import <AFNetworking.h>
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, HttpMethod) {
    HttpMethodGet = 0,
    HttpMethodPost,
    HttpMethodPut,
    HttpMethodDelete,
};
typedef NS_ENUM(NSInteger, HttpSerializer) {
    HttpSerializeDefault      = 0,
    HttpSerializeJSON         = 1,
    HttpSerializePropertyList = 2,
};
@protocol BaseNetToolProtocol <NSObject>
+ (NSURLSessionDataTask *)method:(HttpMethod)method
                      serializer:(HttpSerializer)serializer
                       urlString:(NSString *)urlString
                          params:(NSDictionary *)params
                         timeOut:(NSTimeInterval)timeOut
                         success:(void(^)(id object))success
                         failure:(void(^)(NSError *error))failure;
@end
@interface AFRequestTool : NSObject<BaseNetToolProtocol>
@end
@interface SectionTool : NSObject<BaseNetToolProtocol,NSURLSessionDelegate>
@end
NS_ASSUME_NONNULL_END
