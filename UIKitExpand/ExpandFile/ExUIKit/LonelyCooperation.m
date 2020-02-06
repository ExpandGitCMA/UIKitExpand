#import "LonelyCooperation.h"
#import "CalmDramaticDepartment.h"
@implementation LonelyCooperation
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
    [self setTitle:@" 热点资讯 " forState:UIControlStateNormal];
    self.titleLabel.font = [CalmDramaticDepartment fontWithSize:14];
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
- (void)converselyFabulousHead:(UIColor *)color alpha:(CGFloat)alpha {
    self.backgroundColor = color;
    self.alpha = alpha;
}
@end
