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
    _imageView.contentMode =   UIViewContentModeScaleToFill;
    [self.contentView addSubview:imageView];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _imageView.frame = self.bounds;
}
-(void)wreckBath:(NSString*)url{
    [ _imageView sd_setImageWithURL:[NSURL URLWithString:url]
    placeholderImage:[UIImage imageNamed:@"4_Gods_pocket"]];
}
@end


