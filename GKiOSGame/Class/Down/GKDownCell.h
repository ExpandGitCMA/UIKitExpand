//
//  GKVideoItemCell.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/12.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKDownModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GKDownCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *totalLab;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIButton *downBtn;

@property (strong, nonatomic)GKDownModel *model;
//状态
@property (assign, nonatomic)GKDownTaskState state;
//进度条
@property (assign, nonatomic)CGFloat progress;
@end

NS_ASSUME_NONNULL_END
