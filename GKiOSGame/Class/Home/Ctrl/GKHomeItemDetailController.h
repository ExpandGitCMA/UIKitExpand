//
//  GKHomeItemDetailController.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/11.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "BaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface GKHomeItemDetailController : BaseTableViewController
+ (instancetype)vcWithItemId:(NSString *)itemId;
@end

NS_ASSUME_NONNULL_END
