#import "YoBoDiscuss.h"
#import <SVProgressHUD.h>
@interface YoBoDiscuss ()

@end
@implementation YoBoDiscuss
- (instancetype)init
{
    self = [super init];
    return [[[NSBundle mainBundle]loadNibNamed:@"YoBoDiscuss" owner:self options:nil]lastObject];
}



- (void)awakeFromNib{
    [super awakeFromNib];

    self.backgroundColor = [UIColor clearColor];
    self.OrgyTalkTextView.layer.borderWidth = 1.0f;
    self.OrgyTalkTextView.layer.borderColor = [UIColor colorWithRed:228/255.0 green:227/255.0 blue:234/255.0 alpha:1.0].CGColor;
    self.OrgyTalkTextView.layer.masksToBounds = YES;
}

@end
