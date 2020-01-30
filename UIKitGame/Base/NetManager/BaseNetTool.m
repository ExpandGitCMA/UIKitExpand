#import "BaseNetTool.h"
@implementation AFRequestTool
+ (NSURLSessionDataTask *)method:(HttpMethod)method
                      serializer:(HttpSerializer)serializer
                       urlString:(NSString *)urlString
                          params:(NSDictionary *)params
                         timeOut:(NSTimeInterval)timeOut
                         success:(void(^)(id object))success
                         failure:(void(^)(NSError *error))failure
{
    AFHTTPSessionManager *netManager = [AFHTTPSessionManager manager];
    switch (serializer) {
        case HttpSerializeDefault:
            netManager.requestSerializer = [AFHTTPRequestSerializer serializer];
            netManager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        case HttpSerializePropertyList:
            netManager.requestSerializer = [AFPropertyListRequestSerializer serializer];
            netManager.responseSerializer = [AFJSONResponseSerializer serializer];
        default:
            netManager.requestSerializer = [AFJSONRequestSerializer serializer];
            netManager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
    }
    netManager.requestSerializer.timeoutInterval = timeOut;
    netManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    [netManager.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    [netManager.requestSerializer setValue:@"chrome" forHTTPHeaderField:@"User-Agent"];
    switch (method) {
        case HttpMethodGet: {
            return [netManager GET:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
        case HttpMethodPut: {
            return [netManager PUT:urlString parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
        case HttpMethodDelete: {
            return [netManager DELETE:urlString parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
        case HttpMethodPost: {
            return  [netManager POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                !success ?: success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !failure ?: failure(error);
            }];
        }
        default:
            break;
    }
    return nil;
}
+ (AFSecurityPolicy *)securityPolicy {
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"xxx" ofType:@"cer"];
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    securityPolicy.pinnedCertificates = [NSSet setWithObject:cerData?:@""];
    return securityPolicy;
}
@end
@implementation SectionTool
+ (instancetype)defaultManager
{
    static SectionTool *_netManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_netManager) {
            _netManager = [[self alloc] init ];
        }
    });
    return _netManager;
}
+ (NSURLSessionDataTask *)method:(HttpMethod)method
                      serializer:(HttpSerializer)serializer
                       urlString:(NSString *)urlString
                          params:(NSDictionary *)params
                         timeOut:(NSTimeInterval)timeOut
                         success:(void(^)(id object))success
                         failure:(void(^)(NSError *error))failure
{
    NSString *methods = @"POST";
    switch (method) {
        case HttpMethodGet:{
            methods = @"GET";
            urlString = [NSString stringWithFormat:@"%@%@%@",urlString,params ?@"?":@"",AFQueryStringFromParameters(params)];
            urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        }break;
        case HttpMethodPost:
            methods = @"POST";
            break;
        case HttpMethodPut:
            methods = @"PUT";
            break;
        case HttpMethodDelete:
            methods = @"DELETE";
            break;
        default:
            break;
    }
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:[SectionTool defaultManager] delegateQueue:[NSOperationQueue mainQueue]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    switch (serializer) {
        case HttpSerializeDefault:
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request addValue:@"chrome" forHTTPHeaderField:@"User-Agent"];
            if ([methods isEqualToString:@"POST"]) {
                request.HTTPBody = [AFQueryStringFromParameters(params) dataUsingEncoding:NSUTF8StringEncoding];
            }
            break;
        case HttpSerializeJSON:
            [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            if ([methods isEqualToString:@"POST"]) {
                NSError *error = nil;
                NSData* data = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
                request.HTTPBody = data;
            }
            break;
        case HttpSerializePropertyList:
            [request setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
            break;
        default:
            break;
    }
    [request setHTTPMethod:methods];
    NSURLSessionDataTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            !failure ?: failure(error);
        }else
        {
            !success ?: success(data);
        }
    }];
    [task resume];
    return task ;
}
#pragma mark NSURLSessionDelegate
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler
{
    NSLog(@"%@",challenge.protectionSpace);
    if (![challenge.protectionSpace.authenticationMethod isEqualToString:@"NSURLAuthenticationMethodServerTrust"]) return;
    NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
    completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
}
- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(nullable NSError *)error
{
}
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session
{
}
NSString * parameters(NSDictionary *parameters) {
   __block NSMutableArray *mutablePairs = [NSMutableArray array];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [mutablePairs addObject:[NSString stringWithFormat:@"%@=%@",key,obj]];
    }];
    return [mutablePairs componentsJoinedByString:@"&"];
}
@end
