//
//  GKVideoPlayHeaderView.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/18.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GKVideoPlayHeaderView : UITableViewHeaderFooterView
@property (strong, nonatomic) UIImageView *imageV;
@property (strong, nonatomic) UILabel *titleLab;
@property (strong, nonatomic) UILabel *subTitleLab;

@end

NS_ASSUME_NONNULL_END
