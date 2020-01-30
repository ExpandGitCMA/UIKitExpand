//
//  GKDownloadTask.h
//  GKiOSDownload
//
//  Created by wangws1990 on 2019/7/4.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDownTask.h"


@interface GKDownloadTask : NSObject
+ (void)startDownTask:(BaseDownModel *)model
             progress:(void (^)(NSProgress *pro))progress
           completion:(void (^)(NSString *path,NSError *error))completion;
+ (void)pauseDownTask:(BaseDownModel *)model;
+ (void)deleteDownTask:(BaseDownModel *)model;
@end

