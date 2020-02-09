#import "YBSUIPrivacyView.h"
#import <SVProgressHUD.h>
@interface YBSUIPrivacyView ()

@end
@implementation YBSUIPrivacyView
- (instancetype)init
{
    self = [super init];
    return [[[NSBundle mainBundle]loadNibNamed:@"YBSUIPrivacyView" owner:self options:nil]lastObject];
}
- (void)awakeFromNib{
    [super awakeFromNib];

    self.backgroundColor = [UIColor clearColor];
    self.OrgyTalkTextView.layer.borderWidth = 1.0f;
    self.OrgyTalkTextView.layer.borderColor = [UIColor colorWithRed:228/255.0 green:227/255.0 blue:234/255.0 alpha:1.0].CGColor;
    self.OrgyTalkTextView.layer.masksToBounds = YES;
}

@end
