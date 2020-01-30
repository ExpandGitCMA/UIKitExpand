//
//  GKTimeTool.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/11.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GKTimeTool : NSObject

+ (NSString *)timeStampTurnToDate:(NSTimeInterval)timesTamp;
+ (NSString *)timeStampTurnToTimes:(NSTimeInterval)times;
+ (NSString *)getTimeStamp;
@end

NS_ASSUME_NONNULL_END
