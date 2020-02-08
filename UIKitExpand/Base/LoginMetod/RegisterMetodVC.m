//
//  RegisterMetodVC.m
//  QuLeZuQiu
//
//  Created by 疯子 on 2019/12/25.
//  Copyright © 2019 fengzi. All rights reserved.
//

#import "RegisterMetodVC.h"




@interface RegisterMetodVC ()<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *registedZhangHaoField;
@property (weak, nonatomic) IBOutlet UITextField *registedMiMaField;



@end


@implementation RegisterMetodVC


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.registedZhangHaoField addTarget:self action:@selector(zhangHaofieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.registedMiMaField addTarget:self action:@selector(zhangHaofieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}


-(void)zhangHaofieldDidChange:(UITextField *)textfield{
    if (textfield == self.registedZhangHaoField) {
        if (textfield.text.length >= 11) {
            textfield.text = [textfield.text substringToIndex:11];
        }
    }
    if (textfield == self.registedMiMaField) {
        if (textfield.text.length >= 10) {
            textfield.text = [textfield.text substringToIndex:10];
        }
    }
}


- (IBAction)regisCLosedBtnAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)registedZhuCeBtnAction:(UIButton *)sender {
//    if (self.registedZhangHaoField.text.length == 0) {
//        [SVProgressHUD showInfoWithStatus:@"请输入账号"];
//        return;
//    }
//    if (self.registedMiMaField.text.length == 0) {
//        [SVProgressHUD showInfoWithStatus:@"请输入密码"];
//        return;
//    }
//    [SVProgressHUD show];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [SVProgressHUD showSuccessWithStatus:@"注册成功"];
//        [self dismissViewControllerAnimated:YES completion:nil];
//    });
    
    
    
}


- (IBAction)registedAgreementAction:(UIButton *)sender {
//    QuLePrivateViewController * privateVC = [[QuLePrivateViewController alloc] init];
//       UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:privateVC];
//       [self presentViewController:navc animated:YES completion:nil];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


@end
