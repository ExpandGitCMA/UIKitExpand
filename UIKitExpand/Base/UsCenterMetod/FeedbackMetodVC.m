#import "FeedbackMetodVC.h"
#import <SVProgressHUD.h>
@interface FeedbackMetodVC ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *backTextView;
@end
@implementation FeedbackMetodVC 


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"意见反馈";
    self.backTextView.delegate = self;
}


- (void)textViewDidChange:(UITextView *)textView{
}


- (IBAction)OrgyCommitBtnAction:(UIButton *)sender {
    if (self.backTextView.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请输入意见或者问题"];
        return;
    }
    [SVProgressHUD show];
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showSuccessWithStatus:@"提交成功,谢谢你的反馈"];
        [self.navigationController popToRootViewControllerAnimated:YES];
     });
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end