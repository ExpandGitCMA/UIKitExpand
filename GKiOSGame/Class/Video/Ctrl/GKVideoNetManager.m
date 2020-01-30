//
//  GKVideoNetManager.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/10/9.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKVideoNetManager.h"
#import "GKTimeTool.h"
@implementation GKVideoNetManager
+ (NSURLSessionDataTask *)videoId:(NSString *)videoId
                             page:(NSInteger)page
                          success:(void(^)(id object))success
                          failure:(void(^)(NSString *error))failure{
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"src"] = @"1000";
    params[@"rc"] =  @"8";
    params[@"pageSize"] =  @(RefreshPageSize);
    params[@"pageNo"] =  @(page);
    params[@"channelId"] =  videoId ?: @"";
    params[@"t"] =  [GKTimeTool getTimeStamp];
    return [BaseNetManager method:HttpMethodGet urlString:VideoUrl params:params success:success failure:failure];
}
@end
