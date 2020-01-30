//
//  GKClassifyItemCell.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/15.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKClassifyModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GKClassifyItemCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (strong, nonatomic)GKClassifyItem *item;

@end

NS_ASSUME_NONNULL_END
