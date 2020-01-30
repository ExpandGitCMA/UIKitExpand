//
//  GKSlider.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/12.
//  Copyright © 2019 wangws1990. All rights reserved.
//

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
//    UIImage *image  = [self circleImageWithName:[self originImage:[UIImage imageWithColor:AppColor] scaleToSize:CGSizeMake(12, 12)] borderWidth:2 borderColor:Appxdddddd];
//    [self setThumbImage:image forState:UIControlStateNormal];
//    [self setThumbImage:image forState:UIControlStateHighlighted];
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
    UIGraphicsBeginImageContext(size);//size为CGSize类型，即你所需要的图片尺寸
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
- (UIImage *)circleImageWithName:(UIImage *)oldImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    // 2.开启上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 8.结束上下文
    UIGraphicsEndImageContext();
    return newImage;
}

- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value
{//返回滑块大小
    if (rect.origin.x < 3) {
        rect.origin.x = rect.origin.x - 3;
    }
    rect.size.width = rect.size.width;
    return CGRectInset ([super thumbRectForBounds:bounds trackRect:rect value:value], 12 , 12);
}
- (CGRect)trackRectForBounds:(CGRect)bounds
{
    bounds = [super trackRectForBounds:bounds]; // 必须通过调用父类的trackRectForBounds 获取一个 bounds 值，否则 Autolayout 会失效，UISlider 的位置会跑偏。
    return CGRectMake(bounds.origin.x, bounds.origin.y - 1.5, bounds.size.width, 3);
}
@end
