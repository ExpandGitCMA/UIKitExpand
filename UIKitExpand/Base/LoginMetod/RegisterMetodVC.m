

#import "RegisterMetodVC.h"
#import "SystemNavigationCapture.h"

#import <SVProgressHUD.h>

#import "UserDefaultManager.h"

@interface RegisterMetodVC ()<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end



@implementation RegisterMetodVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavLeftStyle barTarget:self action:@selector(colse) title:@"navigation_back"];
}



-(void)colse{

    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)registedAction:(UIButton *)sender {
  
    if (_accountField.text.length == 0) {
         [SVProgressHUD showInfoWithStatus:@"请输入账号"];
         return;
     }
     if (_passwordField.text.length == 0) {
         [SVProgressHUD showInfoWithStatus:@"请输入密码"];
         return;
     }


    AVUser *user = [AVUser user];
    user.username = _accountField.text;
    user.password = _passwordField.text;
        
    [SVProgressHUD show];
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
           if (succeeded) {
               // 注册成功直接登录
               [AVUser logInWithUsernameInBackground:_accountField.text password:_passwordField.text block:^(AVUser *user, NSError *error){
                   if (user) {
                      
                        [SVProgressHUD showSuccessWithStatus:@"注册成功"];
                        User*users = [ User userWithDict:@{
                                       @"mobile": user.username,
                                       @"name" : @"我的账号",
                                       @"token":user.sessionToken,
                                       @"uid":user.objectId,
                         }];
                        [[UserDefaultManager sharedDefaultManager]saveAccount:users];
                        [self dismissViewControllerAnimated:YES completion:nil];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterMetod" object:nil];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"UsCenter" object:nil];
                       DEBUG_NSLog(@"========注册成功直接登录=======%@",user);
                   } else {
                       DEBUG_NSLog(@"登录失败：%@",error.localizedFailureReason);
                       [SVProgressHUD showSuccessWithStatus:error.localizedFailureReason];
                   }
               }];
           }else if(error.code == 202){
                DEBUG_NSLog(@"注册失败，用户名已经存在==%@",error.localizedFailureReason);
                [SVProgressHUD showSuccessWithStatus:@"注册失败,用户名已经存在"];
           }else{
               DEBUG_NSLog(@"注册失败：%@",error.localizedFailureReason);
               [SVProgressHUD showSuccessWithStatus:error.localizedFailureReason];
           }
       }];
    
}

- (IBAction)registedAgreementAction:(UIButton *)sender {

     [LatelyMetodRouter switchTopushUserPrivacyVC:self];
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


@end
