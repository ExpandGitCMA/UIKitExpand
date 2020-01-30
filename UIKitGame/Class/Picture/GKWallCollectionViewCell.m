#import "GKWallCollectionViewCell.h"
@implementation GKWallCollectionViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
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
