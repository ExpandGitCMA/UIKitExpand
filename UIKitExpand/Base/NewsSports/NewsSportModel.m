//
//  NewsSportModel.m
//  UIKitExpand
//
//  Created by Smell Zero on 2020/2/2.
//  Copyright © 2020 陈美安. All rights reserved.
//

#import "NewsSportModel.h"

@implementation NewsSportModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (NewsSportModel *)setModelWithDictionary:(NSDictionary *)dic {
    NewsSportModel *tick = [[NewsSportModel alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
