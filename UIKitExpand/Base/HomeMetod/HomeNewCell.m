#import "HomeNewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSString+IMAdditions.h"
@implementation HomeNewCell
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(void)setModel:(NewsModel *)model{
    _title.text = model.title;
    _timer .text = [model.source isNull]?model.source:model.intro;
    
    NSString *url;
    if ([self isUrl:model.thumbnail]) {
        url = model.thumbnail;
    }else{
        
        url = [NSString stringWithFormat:@"%@%@",@"https://n.sinaimg.cn",model.thumbnail];
    }
    
    [_image sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"icon_data_empty"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
           if (image) {
              _image.contentMode = UIViewContentModeScaleToFill;
           }
       }];
}



- (BOOL)isUrl:(NSString *)str{
    if ([str hasPrefix:@"http://"] || [str hasPrefix:@"https://"]) {
        return YES;
    }
    return NO;
}
@end
