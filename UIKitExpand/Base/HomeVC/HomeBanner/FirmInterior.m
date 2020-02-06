#import "FirmInterior.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation FirmInterior
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
    }
    return self;
}
- (void)setupImageView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    _imageView = imageView;
    _imageView.contentMode =     UIViewContentModeCenter;
    [self.contentView addSubview:imageView];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _imageView.frame = self.bounds;
}
-(void)mixPartyDirty:(NSString*)url{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"icon_data_empty"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            _imageView.contentMode = UIViewContentModeScaleToFill;
        }
    }];
}
@end
