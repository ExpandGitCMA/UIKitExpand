//
//  GKVideoItem.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/10/9.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKVideoItem.h"

@implementation GKVideoItem
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"itemId" : @[@"itemId",@"id"]};
}
@end

@implementation GKItemModel

@end

@implementation GKVideoModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"streams" : GKVideoStreams.class};
}
- (GKVideoStreams *)selectStreams{
    if (!_selectStreams) {
        return self.streams.firstObject;
    }
    return _selectStreams;
}
@end


@implementation GKVideoStreams
- (NSString *)name{
    return [NSString stringWithFormat:@"%@x%@",@(self.width),@(self.height)];
}
@end
