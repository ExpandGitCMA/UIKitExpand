//
//  YoBoRegistViewController.m
//  YaBoOrgy
//
//  Created by admin on 12/2/2020.
//  Copyright © 2020 SportsMac. All rights reserved.
//

#import "YoBoRegistViewController.h"
#import <SVProgressHUD.h>
#import "YoBoDefault.h"
#import "ImpairBeingController.h"
#import "YoBoLoginUser.h"
@interface YoBoRegistViewController ()<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation YoBoRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"注册";
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
               [AVUser logInWithUsernameInBackground:self->_accountField.text password:self->_passwordField.text block:^(AVUser *user, NSError *error){
                   if (user) {
                      
                        [SVProgressHUD showSuccessWithStatus:@"注册成功"];
                       YoBoLoginUser*users = [ YoBoLoginUser userWithDict:@{
                                       @"mobile": user.username,
                                       @"name" : @"我的账号",
                                       @"token":user.sessionToken,
                                       @"uid":user.objectId,
                         }];
                        [[YoBoDefault defaultUser]keyedUser:users];
                        [self dismissViewControllerAnimated:YES completion:nil];
                   } else {
                       [SVProgressHUD showSuccessWithStatus:error.localizedFailureReason];
                   }
               }];
           }else if(error.code == 202){
                [SVProgressHUD showSuccessWithStatus:@"注册失败,用户名已经存在"];
           }else{
               [SVProgressHUD showSuccessWithStatus:error.localizedFailureReason];
           }
       }];
    
}

- (IBAction)registedAgreementAction:(UIButton *)sender {

      ImpairBeingController *controller = [[ImpairBeingController  alloc] init];
      [self.navigationController pushViewController:controller animated:YES];
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
