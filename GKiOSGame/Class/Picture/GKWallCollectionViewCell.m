//
//  GKWallCollectionViewCell.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/16.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKWallCollectionViewCell.h"

@implementation GKWallCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setModel:(GKWallModel *)model{
    
    if (_model != model) {
        _model = model;
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.litpic] placeholderImage:placeholder];
        self.titleLab.text = model.title ?:@"";
        self.countLab.text = [NSString stringWithFormat:@"%@",@(model.click)];
        self.nickNameLab.text = [NSString stringWithFormat:@"来源:%@",model.writer?:@""];
    }
    
}
@end
