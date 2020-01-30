//
//  GKHomeItemCell.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/11.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKHomeItemCell.h"

@implementation GKHomeItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.height.constant = SCALEW(70);
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(GKHomeNewModel *)model{
    if (_model != model) {
        _model = model;
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.litpic] placeholderImage:placeholder];
        self.titleLab.text = model.title ?:@"";
        self.subTitleLab.text = model.longtitle?:@"";
        self.timeLab.text = [GKTimeTool timeStampTurnToDate:model.timestamp];
        self.readCountLab.text = [NSString stringWithFormat:@"%@阅读",@(model.click).decimalString];
    }
}
@end
