//
//  GKVideoPlayCell.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/15.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKVideoPlayCell.h"

@implementation GKVideoPlayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(GKDownModel *)model{
    _model = model;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.thumbnail_url] placeholderImage:placeholder];
    self.titleLab.text = model.title ?:@"";
    self.subTitleLab.text = [NSString stringWithFormat:@"更新时间:%@",[GKTimeTool timeStampTurnToDate:model.create_time.longLongValue]];
}
@end
