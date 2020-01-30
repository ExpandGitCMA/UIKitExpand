//
//  GKClarityCell.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/16.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKClarityCell.h"

@implementation GKClarityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = self.contentView.backgroundColor = [UIColor blackColor];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
