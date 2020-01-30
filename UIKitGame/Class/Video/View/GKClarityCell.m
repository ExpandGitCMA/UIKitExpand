#import "GKClarityCell.h"
@implementation GKClarityCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = self.contentView.backgroundColor = [UIColor blackColor];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
