//
//  GKVideoPlayController.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/12.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "BaseTableViewController.h"
#import "GKDownModel.h"
#import "GKVideoItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface GKVideoPlayController : BaseTableViewController
+ (instancetype)vcWithPlayModel:(GKVideoModel *)model;
@end

NS_ASSUME_NONNULL_END
