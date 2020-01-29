#import "SlopeButBenefit.h"
#import "PartialMaintenance.h"
@implementation SlopeButBenefit
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initSearch];
    }
    return self;
}
-(void)initSearch{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 20;
    [self setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    self.adjustsImageWhenHighlighted = NO;
    [self setTitle:@" 足球娱乐搜索推荐 " forState:UIControlStateNormal];
    self.titleLabel.font = [PartialMaintenance fontWithSize:14];
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self setTitleColor:kUIColorFromRGB(ExAddress) forState:UIControlStateNormal];
    if (ISRIGHTTOLEFT) {
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    } else {
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 10)];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    }
}
- (void)believeDashMoving:(UIColor *)color alpha:(CGFloat)alpha {
    self.backgroundColor = color;
    self.alpha = alpha;
}
@end
