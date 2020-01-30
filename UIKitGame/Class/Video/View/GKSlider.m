#import "GKSlider.h"
@implementation GKSlider
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self loadUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self loadUI];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self loadUI];
}
- (void)loadUI{
    self.thumbTintColor = AppColor;
    CGFloat w = 24;
    UIImage * thumbImg = [UIImage imageWithColor:AppColor size:CGSizeMake(w, w)];
    thumbImg = [thumbImg imageByRoundCornerRadius:w/2 borderWidth:5 borderColor:[UIColor clearColor]];
    [self setThumbImage:thumbImg forState:UIControlStateNormal];
    thumbImg = [UIImage imageWithColor:AppColor size:CGSizeMake(w, w)];
    thumbImg = [thumbImg imageByRoundCornerRadius:w/2];
    [self setThumbImage:thumbImg forState:UIControlStateHighlighted];
    self.minimumTrackTintColor = AppColor;
    self.maximumTrackTintColor = [UIColor clearColor];
    self.progressView.progressTintColor = Appx999999;
    self.progressView.trackTintColor = Appxdddddd;
    [self addSubview:self.progressView];
    [self sendSubviewToBack:self.progressView];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(3.0f);
        make.left.equalTo(self.progressView.superview).offset(6);
        make.right.equalTo(self.progressView.superview).offset(-6);
        make.centerY.equalTo(self.progressView.superview).offset(0);
    }];
}
- (UIProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.userInteractionEnabled = NO;
    }
    return _progressView;
}
- (UIImage *)originImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
- (UIImage *)circleImageWithName:(UIImage *)oldImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; 
    CGFloat centerX = bigRadius; 
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); 
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    CGContextClip(ctx);
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value
{
    if (rect.origin.x < 3) {
        rect.origin.x = rect.origin.x - 3;
    }
    rect.size.width = rect.size.width;
    return CGRectInset ([super thumbRectForBounds:bounds trackRect:rect value:value], 12 , 12);
}
- (CGRect)trackRectForBounds:(CGRect)bounds
{
    bounds = [super trackRectForBounds:bounds]; 
    return CGRectMake(bounds.origin.x, bounds.origin.y - 1.5, bounds.size.width, 3);
}
@end
