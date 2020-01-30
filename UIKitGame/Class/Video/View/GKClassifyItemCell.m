#import "GKClassifyItemCell.h"
@implementation GKClassifyItemCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageV.layer.masksToBounds = YES;
    self.imageV.layer.cornerRadius = AppRadius;
}
- (void)setItem:(GKClassifyItem *)item{
    if (_item != item) {
        _item = item;
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:item.icon] placeholderImage:placeholder];
        self.titleLab.text = item.name ?:@"";
    }
}
@end
