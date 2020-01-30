//
//  GKWallCollectionViewCell.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/16.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKWallModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GKWallCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *countLab;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLab;

@property (strong, nonatomic)GKWallModel *model;

@end

NS_ASSUME_NONNULL_END
