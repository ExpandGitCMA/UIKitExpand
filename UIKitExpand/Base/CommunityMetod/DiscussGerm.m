#import "DiscussGerm.h"
#import <SVProgressHUD.h>
@interface DiscussGerm ()
@property (weak, nonatomic) IBOutlet UITextView *OrgyTalkTextView;
@end
@implementation DiscussGerm
- (instancetype)init
{
    self = [super init];
    return [[[NSBundle mainBundle]loadNibNamed:@"DiscussGerm" owner:self options:nil]lastObject];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    self.OrgyTalkTextView.layer.borderWidth = 1.0f;
    self.OrgyTalkTextView.layer.borderColor = [UIColor colorWithRed:228/255.0 green:227/255.0 blue:234/255.0 alpha:1.0].CGColor;
    self.OrgyTalkTextView.layer.masksToBounds = YES;
}
- (IBAction)cancelBtnAction:(UIButton *)sender {
    [self removeFromSuperview];
}
- (IBAction)ofCourseBtnAction:(UIButton *)sender {
    if (self.OrgyTalkTextView.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"评论不能为空"];
        return;
    }
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showSuccessWithStatus:@"评论成功，我们将在5个小时内审核您的评论"];
        [self removeFromSuperview];
    });
}
@end
