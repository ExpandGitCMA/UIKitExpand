//
//  GKWallItemModel.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/16.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "BaseModel.h"
#import "ATBrowserProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface GKWallItemModel : BaseModel<ATBrowserProtocol>

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *desc;

@property (copy, nonatomic) NSString *url;
@property (strong, nonatomic) UIImage *image;

@end

NS_ASSUME_NONNULL_END
