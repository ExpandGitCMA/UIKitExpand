//
//  GKDownModel.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/10/9.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKDownModel.h"
#import "BaseDownTool.h"
@implementation GKDownModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"nickName" : @"author.user_name",
             @"page" : @"p",
             @"desc" : @"ext.desc",
             @"bookID" : @[@"id",@"ID",@"book_id"]};
}
- (NSString *)path{
    if ([_path hasPrefix:[AFDownTool downloadPath]]) {
        return _path;
    }
    return [NSString stringWithFormat:@"%@%@",[AFDownTool downloadPath],_path];
}
@end
