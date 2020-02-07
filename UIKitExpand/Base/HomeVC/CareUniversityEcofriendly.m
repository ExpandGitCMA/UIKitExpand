#import "CareUniversityEcofriendly.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSString+IMAdditions.h"
@implementation CareUniversityEcofriendly
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(void)setModel:(NewsModel *)model{
    _title.text = model.title;
    _timer .text = [model.source isNull]?model.source:model.intro;
    [_image sd_setImageWithURL:[NSURL URLWithString:model.thumbnail] placeholderImage:[UIImage imageNamed:@"icon_data_empty"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
           if (image) {
              _image.contentMode = UIViewContentModeScaleToFill;
           }
       }];
}
@end
