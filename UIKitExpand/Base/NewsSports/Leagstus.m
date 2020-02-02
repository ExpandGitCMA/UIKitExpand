//
//  Leagstus.m
//  UIKitExpand
//
//  Created by Smell Zero on 2020/2/2.
//  Copyright © 2020 陈美安. All rights reserved.
//

#import "Leagstus.h"

@implementation Leagstus
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ ( Leagstus *)setModelWithDictionary:(NSDictionary *)dic {
     Leagstus *tick = [[Leagstus alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
