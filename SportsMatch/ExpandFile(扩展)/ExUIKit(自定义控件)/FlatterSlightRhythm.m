#import "FlatterSlightRhythm.h"
#import "ExpandColorHeader.h"
@interface FlatterSlightRhythm ()
@property (nonatomic,strong) UIImage *imgSearch;
@end
@implementation FlatterSlightRhythm
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imgSearch = [UIImage imageNamed:@"img_search_icon"];
        UIImageView *imgViewSearch = [[UIImageView alloc] initWithImage:_imgSearch];
        self.leftView = (UIView *)imgViewSearch;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.layer.cornerRadius = 5 ;
        self.backgroundColor = [UIColor whiteColor];
        self.returnKeyType = UIReturnKeySearch;
        self.font = [UIFont systemFontOfSize:14];
        self.borderStyle = UITextBorderStyleNone;
        self.placeholder = @"搜索";
        self.backgroundColor = kUIColorFromRGB(ExSearch);
        self.tintColor = kUIColorFromRGB(AppMianColor);
    }
    return self;
}
-(CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(bounds.origin.x+8, (bounds.size.height - 12) *0.5 , _imgSearch.size.width, _imgSearch.size.height);
    return inset;
}
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+29, bounds.origin.y, bounds.size.width -50, bounds.size.height);
    return inset;
}
-(CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+29, bounds.origin.y, bounds.size.width -50, bounds.size.height);
    return inset;
}
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x +29, bounds.origin.y, bounds.size.width -50, bounds.size.height);
    return inset;
}
@end
