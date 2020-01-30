//
//  GKVideoNetManager.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/10/9.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GKVideoNetManager : NSObject
+ (NSURLSessionDataTask *)videoId:(NSString *)videoId
                             page:(NSInteger)page
                          success:(void(^)(id object))success
                          failure:(void(^)(NSString *error))failure;
@end

NS_ASSUME_NONNULL_END
