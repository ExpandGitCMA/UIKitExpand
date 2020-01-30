#import "GKVideoPlayCell.h"
@implementation GKVideoPlayCell
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)setModel:(GKDownModel *)model{
    _model = model;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.thumbnail_url] placeholderImage:placeholder];
    self.titleLab.text = model.title ?:@"";
    self.subTitleLab.text = [NSString stringWithFormat:@"更新时间:%@",[GKTimeTool timeStampTurnToDate:model.create_time.longLongValue]];
}
@end
