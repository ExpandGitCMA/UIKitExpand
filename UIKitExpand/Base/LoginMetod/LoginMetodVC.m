

#import "LoginMetodVC.h"
#import "RegisterMetodVC.h"


@interface LoginMetodVC ()

@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *protocol;



@end



@implementation LoginMetodVC



- (void)viewDidLoad {
    [super viewDidLoad];
  
}





- (IBAction)loginCloseBtnAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)loginBtnAction:(UIButton *)sender {

   
}



- (IBAction)regisBtnAction:(UIButton *)sender {
   
}



- (IBAction)protocolBtnAction:(UIButton *)sender {
   
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
