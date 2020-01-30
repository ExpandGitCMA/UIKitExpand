#import "BaseNetModel.h"
@implementation BaseNetModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"msg" : @[@"msg",@"error"],@"result":@[@"data",@"result"],@"ok":@[@"rs",@"ok",@"code"]};
}
-(BOOL)isDataSuccess
{
    return self.ok == 1 || self.ok == 0;
}
- (BOOL)isNetError
{
    return self.ok != 1;
}
+ (instancetype)successModel:(id)response urlString:(NSString *)urlString params:(NSDictionary *)params headParams:(NSDictionary *)headParams
{
    NSDictionary *allResultData = nil;
    if ([response isKindOfClass:NSArray.class]&&response) {
        allResultData = @{@"resultset":response,@"ok":@"1"};
    }else if([response isKindOfClass:NSDictionary.class]){
        allResultData = response;
    }else if(response){
        BOOL res = ![response isKindOfClass:NSArray.class] || ![response isKindOfClass:NSDictionary.class];
        NSAssert(!res,@"response must NSArray or NSDictionary");
    }
    BaseNetModel * model = [BaseNetModel modelWithJSON:allResultData];
    model.allResult = allResultData;
    model.requestUrl = urlString;
    model.params = params;
    model.headParams = headParams;
    if (![model.allResult containsObjectForKey:@"ok"]&&![model.allResult containsObjectForKey:@"code"]) {
        model.ok = 1;
    }
    if (!model.result) {
        NSDictionary *result = model.allResult[@"resultset"];
        model.result = result.count ? result : model.allResult;
    }
    if(![model isDataSuccess])
    {
        NSLog(@"%@\n%@\n%@\n%@\n",urlString,params,headParams,model.allResult);
    }
    return model;
}
+ (NSDictionary *)analysisData:(id)response{
    NSError * error = nil;
    NSDictionary * obj  = nil;
    if ([response isKindOfClass:[NSString class]])
    {
        obj = [NSJSONSerialization JSONObjectWithData:[response dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
    }else if ([response isKindOfClass:[NSData class]])
    {
        obj = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&error];
        if (error) {
            NSString *errorStr = error.userInfo[@"NSDebugDescription"];
            if ([errorStr containsString:@"Unable to convert data"]) {
                NSString* strdata = [[NSString alloc]initWithData:response encoding:NSISOLatin1StringEncoding];
                NSData * data = [strdata dataUsingEncoding:NSUTF8StringEncoding];
                obj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error ];
            }
        }
    }
    else if ([response isKindOfClass:[NSDictionary class]])
    {
        obj = response;
    }else if ([response isKindOfClass:[NSArray class]]){
        obj = response;
    }
    return obj;
}
+ (instancetype)netErrorModel:(NSString *)error
{
    BaseNetModel * model = [[[self class] alloc] init];
    model.msg = error;
    model.ok = 404;
    model.result = nil;
    model.allResult = nil;
    return model;
}
+ (NSString *)analysisError:(NSError *)error{
    NSString *info = @"";
    switch (error.code) {
        case NSURLErrorNotConnectedToInternet:
            info = @"无网络连接,请检查网络设置";
            break;
        case NSURLErrorTimedOut:
            info = @"服务器请求超时,请重试!";
            break;
        default:
            info = error.userInfo[@"NSLocalizedDescription"];
            break;
    }
    return info;
}
@end
