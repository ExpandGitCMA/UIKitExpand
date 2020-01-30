//
//  BeatLikeNewspaper.m
//  UIKitExpand
//
//  Created by Smell Zero on 2020/1/30.
//  Copyright © 2020 陈美安. All rights reserved.
//

#import "BeatLikeNewspaper.h"

@implementation BeatLikeNewspaper
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (BeatLikeNewspaper *)setModelWithDictionary:(NSDictionary *)dic {
    BeatLikeNewspaper *tick = [[BeatLikeNewspaper alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end


