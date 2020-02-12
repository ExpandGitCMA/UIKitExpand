#import "MatterUnexpectedLongitude.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation MatterUnexpectedLongitude
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
-(void)wreckBath:(NSString*)url{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"icon_data_empty"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            self->_imageView.contentMode = UIViewContentModeScaleAspectFill;
        }
    }];
}
@end
