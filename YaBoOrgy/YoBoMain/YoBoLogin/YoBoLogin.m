
#import "YoBoLogin.h"

#import <SVProgressHUD.h>
#import "YoBoLoginUser.h"
#import "YoBoDefault.h"
#import "ImpairBeingController.h"
#import "YoBoRegistViewController.h"


@interface YoBoLogin ()

@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *protocol;

@end



@implementation YoBoLogin
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavLeftStyle barTarget:self action:@selector(colse) title:@"navigation_back"];
}



- (void)colse{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)loginBtnAction:(UIButton *)sender {

    if (_accountField.text.length == 0) {
         [SVProgressHUD showInfoWithStatus:@"请输入账号"];
         return;
     }
     if (_passwordField.text.length == 0) {
         [SVProgressHUD showInfoWithStatus:@"请输入密码"];
         return;
     }

    
    [SVProgressHUD show];
    NSString *name = _accountField.text;
    NSString *pasw = _passwordField.text;
    [AVUser logInWithUsernameInBackground:name password:pasw block:^(AVUser *user, NSError *error){
       if (user) {
       
            DEBUG_NSLog(@"登录：%@",user);
            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
            YoBoLoginUser*users = [ YoBoLoginUser userWithDict:@{
                             @"mobile": user.username,
                             @"name" : @"我的账号",
                             @"token":user.sessionToken,
                             @"uid":user.objectId,
                             }];
            [[YoBoDefault defaultUser]keyedUser:users];
            [self dismissViewControllerAnimated:YES completion:nil];
           
        } else {
           DEBUG_NSLog(@"登录失败：%@",error.localizedFailureReason);
            NSString*msg = @"网络异常,请稍后尝试!";
            if(error.code == 210){
                 msg = @"账号或者密码错误!";
            }else  if(error.code == 211){
                 msg = @"用户不存在!";
            }
           [SVProgressHUD showSuccessWithStatus:msg];
        }
    }];
}


- (IBAction)regisBtnAction:(UIButton *)sender {

    __weak typeof(self)weakSelf = self;
    YoBoRegistViewController *legistView= [ YoBoRegistViewController new];
        legistView.loadBlock = ^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
    [self.navigationController pushViewController:legistView animated:YES];
}


- (IBAction)protocolBtnAction:(UIButton *)sender {

      ImpairBeingController *controller = [[ImpairBeingController  alloc] init];
     [self.navigationController pushViewController:controller animated:YES];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


// 只能输入字母和数字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    
    if (textField.text.length>12) {
        return NO;
    }
    return [string isEqualToString:filtered];
}




@end
