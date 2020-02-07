#import "HotContentCell.h"
#import "SportsColorHeader.h"
@interface HotContentCell ()
@property(nonatomic,strong)UIView *viewSelect; 
@end
@implementation HotContentCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor =  kUIColorFromRGB(DefaulColor);
        _titleLabel.font=[UIFont systemFontOfSize:16];
        _titleLabel.textAlignment =  NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        _viewSelect = [[UIView alloc] init];
        [self.contentView addSubview:_titleLabel];
    }
    return self;
}
-(void)setSelectCell:(BOOL)isSelect{
    if (isSelect) {
        _titleLabel.textColor = kUIColorFromRGB(DefaulColor);
         _titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:20.0f];
        _viewSelect.backgroundColor = kUIColorFromRGB(DefaulColor);
        _viewSelect.hidden = NO;
    }else{
        _titleLabel.textColor = kUIColorFromRGB(BgGrayColore);
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _viewSelect.hidden = YES;
    }
}
- (CGSize)sizeForCell:(NSString*)title{
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Medium" size:20.0f]}];
    CGSize titleSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    _titleLabel.frame=CGRectMake(5, 15, titleSize.width, titleSize.height);
    _viewSelect.frame=CGRectMake(5, titleSize.height+26, titleSize.width, 2);
    return CGSizeMake(titleSize.width, titleSize.height);
}
@end
