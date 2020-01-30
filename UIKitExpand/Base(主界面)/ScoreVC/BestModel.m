//
//  BestModel.m
//  UIKitExpand
//
//  Created by Smell Zero on 2020/1/30.
//  Copyright © 2020 陈美安. All rights reserved.
//

#import "BestModel.h"

@implementation BestModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (BestModel *)setModelWithDictionary:(NSDictionary *)dic {
    BestModel *tick = [[BestModel alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
