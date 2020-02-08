

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
    NSDictionary*dict = @{
        @"login_type":@"0",
        @"identity_no":@"1003",
        @"dev_name":@"",
        @"imei":@"B900E334868556ejrwowq]r8576BF3031",
        @"dev_name":@"iPhone6",
        @"app_type":@"2",
        @"username":_accountField.text,
        @"password":_passwordField.text,
    };
    
    [SVProgressHUD show];
    
    [[HttpNetWorkManager sharedManager] requestWithMetod:URL_Login params:dict completed:^(BOOL ret, id obj) {
    
        if (ret) {
            DEBUG_NSLog(@"======注册==%@",obj)
            [SVProgressHUD showSuccessWithStatus:@"注册成功"];
              User*user = [ User userWithDict:@{
                  @"mobile": _accountField.text,
                  @"name" : _accountField.text,
                  @"token":@"eyJleHAiOjE1ODM3NjIyNzMsInVzZXJfaWQiOjQ0OTcsImlDzzQBGtUQ9zB9ZZQ7iDPH0Gp6cTAU",
                  @"uid":@"wQdej5",
              }];
            [[UserDefaultManager sharedDefaultManager]saveAccount:user];
            [self dismissViewControllerAnimated:YES completion:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterMetod" object:nil];
        
        }else{
              [SVProgressHUD showInfoWithStatus:@"网络不畅,请稍微尝试"];
            
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
