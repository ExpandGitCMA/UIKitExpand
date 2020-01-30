#import "GKVideoItemCell.h"
@implementation GKVideoItemCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageV.layer.masksToBounds = YES;
    self.imageV.layer.cornerRadius = 5;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)setModel:(GKItemModel *)model{
    if (_model != model) {
        _model = model;
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.video.cover] placeholderImage:[UIImage imageWithColor:Appxf8f8f8]];
        self.titleLab.text = model.video.title ?:@"";
        self.timeLab.text = [GKTimeTool timeStampTurnToDate:model.video.publishTime.longLongValue/1000];
        self.totalLab.text = [GKTimeTool timeStampTurnToTimes:model.video.duration.longLongValue];
    }
}
@end
