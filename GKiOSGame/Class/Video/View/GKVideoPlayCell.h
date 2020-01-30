//
//  GKVideoPlayCell.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/15.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKDownModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GKVideoPlayCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLab;

@property (strong, nonatomic) GKDownModel *model;

@end

NS_ASSUME_NONNULL_END
