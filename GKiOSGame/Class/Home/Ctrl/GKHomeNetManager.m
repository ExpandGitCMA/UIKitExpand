//
//  GKHomeNetManager.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/11.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKHomeNetManager.h"

@implementation GKHomeNetManager
+ (NSURLSessionDataTask *)home:(GKHomeItem *)item
                          page:(NSInteger)page
                       success:(void(^)(id object))success
                       failure:(void(^)(NSString *error))failure{
    NSString *url = BaseUrl;
    NSMutableDictionary *params = @{}.mutableCopy;
    [params addEntriesFromDictionary:[GKHomeNetManager params]];
    params[@"start"] = @(page);
    if (item.mod.length) {
        params[@"mod"] = item.mod;
    }
    if (item.dtid.length) {
        params[@"dtid"] = item.dtid;
    }
    if (item.type.length) {
        params[@"type"] = item.type;
    }
    if (item.classs.length) {
        params[@"class"] = item.classs;
    }
    if (item.classmore.length) {
        params[@"classmore"] = item.classmore;
    }
    if (item.typechild.length) {
        params[@"typechild"] = item.typechild;
    }
    if (item.ids.length) {
        params[@"id"] = item.ids;
        [params removeObjectForKey:@"start"];
        url = BaseUrl2;
    }
    return [BaseNetManager method:HttpMethodGet urlString:url params:params success:success failure:failure];
}//["classmore": "indexpic", "appid": "1", "id": "", "dtid": "", "type": "", "page": "1", "appver": "2.1", "class": "", "mod": ""]
+ (NSURLSessionDataTask *)wallDetail:(NSString *)aid
                             success:(void(^)(id object))success
                             failure:(void(^)(NSString *error))failure{
    NSMutableDictionary *params = @{}.mutableCopy;
    [params addEntriesFromDictionary:[GKHomeNetManager params]];
    params[@"aid"] = aid ?:@"";
    return [BaseNetManager method:HttpMethodGet urlString:BaseUrl params:params success:success failure:failure];
}
+ (NSURLSessionDataTask *)detail:(NSString *)action
                          newsId:(NSString *)newsId
                         success:(void(^)(id object))success
                         failure:(void(^)(NSString *error))failure{
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"newsId"] = newsId ?:@"";
    params[@"action"] = action ?:@"";
    return [BaseNetManager method:HttpMethodGet urlString:kBaseUrl(@"apiNewsList.php") params:params success:success failure:failure];
}
+ (NSURLSessionDataTask *)hotVideo:(NSString *)action
                               src:(NSString *)src
                               tag:(NSString *)tag
                              page:(NSInteger)page
                           success:(void(^)(id object))success
                           failure:(void(^)(NSString *error))failure{
    NSMutableDictionary *params = @{}.mutableCopy;
    [params addEntriesFromDictionary:[GKHomeNetManager params]];
    params[@"start"] = @(page);
    params[@"type"] = @"video";
    params[@"dtid"] = @"83623,31528,31537,31538,57067,91821";
    return [BaseNetManager method:HttpMethodGet urlString:BaseUrl params:params success:success failure:failure];
}

+ (NSURLSessionDataTask *)videoPlay:(NSString *)action
                                vid:(NSString *)vid
                            success:(void(^)(id object))success
                            failure:(void(^)(NSString *error))failure{
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"action"] = action ?:@"";
    params[@"vid"] = vid ?:@"";
    return [BaseNetManager method:HttpMethodGet urlString:kBaseUrl(@"apiVideoesNormalDuowan.php") params:params success:success failure:failure];
}
+ (NSURLSessionDataTask *)classify:(NSString *)action
                               src:(NSString *)src
                           success:(void(^)(id object))success
                           failure:(void(^)(NSString *error))failure{
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"action"] = action ?:@"";
    params[@"src"] = src ?:@"";
    return [BaseNetManager method:HttpMethodGet urlString:kBaseUrl(@"apiVideoesNormalDuowan.php") params:params success:success failure:failure];
}

+ (NSURLSessionDataTask *)wall:(NSString *)albumsTag
                        action:(NSString *)action
                          page:(NSInteger)page
                       success:(void(^)(id object))success
                       failure:(void(^)(NSString *error))failure{
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"albumsTag"] = albumsTag ?:@"";
    params[@"action"] = action ?:@"";
    params[@"p"] = @(page);
    return [BaseNetManager method:HttpMethodGet urlString:kBaseUrl(@"apiAlbum.php") params:params success:success failure:failure];
}
+ (NSURLSessionDataTask *)wallDetail:(NSString *)albumId
                              action:(NSString *)action
                             success:(void(^)(id object))success
                             failure:(void(^)(NSString *error))failure{
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"albumId"] = albumId ?:@"";
    params[@"action"] = action ?:@"";
    return [BaseNetManager method:HttpMethodGet urlString:kBaseUrl(@"apiAlbum.php") params:params success:success failure:failure];
}
+ (NSDictionary *)params{
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"appid"] = @"1";
    params[@"appver"] = @"2.1";
//    params[@"classmore"] = @"indexpic";
    return params;
//    params[@"appver"] = @"2.1";
}
@end
