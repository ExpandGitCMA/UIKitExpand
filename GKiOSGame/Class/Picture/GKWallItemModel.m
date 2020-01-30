//
//  GKWallItemModel.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/16.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKWallItemModel.h"

@implementation GKWallItemModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"title" : @[@"title",@"text"],@"url":@"pic"};
}
@end
