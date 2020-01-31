#import "TossUnnecessaryConsiderationView.h"
#import "AppColorHeader.h"
static NSString *FDMSG_Home_DataEmpty    = @"数据空空如也...";
@interface TossUnnecessaryConsiderationView ()
@end
@implementation TossUnnecessaryConsiderationView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image  = [UIImage imageNamed:@"icon_data_empty"];
        self.contentMode =   UIViewContentModeCenter;
        UILabel *tip = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bounds.size.height/2+50, self.bounds.size.width, 50)];
        tip.textAlignment =  NSTextAlignmentCenter;
        tip.textColor = kUIColorFromRGB(Appx999999);
        tip.text = FDMSG_Home_DataEmpty;
        [self addSubview:tip];
    }
    return self;
}
@end
