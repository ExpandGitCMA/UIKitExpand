//
//  GKClassifyModel.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/15.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKClassifyModel.h"

@implementation GKClassifyModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"subCategory" : [GKClassifyItem class] };
}
@end


@implementation GKClassifyItem

@end
