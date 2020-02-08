
#import "LoginMetodVC.h"

#define NUM @"0123456789"
#define ALPHA @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

#import "HttpNetWorkManager.h"
#import <SVProgressHUD.h>
#import "User.h"
#import "UserDefaultManager.h"
@interface LoginMetodVC ()

@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *protocol;

@end



@implementation LoginMetodVC
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavLeftStyle barTarget:self action:@selector(colse) title:@"navigation_back"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationWillChange:) name:@"RegisterMetod" object:nil];
}

- (void)orientationWillChange:(NSNotification *)notification {
      if ([UserDefaultManager isLogin]) {
         [self colse];
     }
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
    NSDictionary*dict = @{
        @"login_type":@"0",
        @"identity_no":@"1003",
        @"dev_name":@"",
        @"imei":@"B900E33486855699C82FB8576BF3031",
        @"dev_name":@"iPhone6",
        @"app_type":@"2",
        @"username":_accountField.text,
        @"password":_passwordField.text,
    };
    
    [SVProgressHUD show];
    
    [[HttpNetWorkManager sharedManager] requestWithMetod:URL_Login params:dict completed:^(BOOL ret, id obj) {
    
        if (ret) {
            
            id codeStr = [obj objectForKey:@"status"];
            NSString *message =  obj[@"message"];
            if ( [codeStr intValue] == 0) {
                      [SVProgressHUD showSuccessWithStatus:@"登录成功"];
                      
                      User*user = [ User userWithDict:obj[@"data"]];
                      [[UserDefaultManager sharedDefaultManager]saveAccount:user];
                      [self dismissViewControllerAnimated:YES completion:nil];
                
                   }else{
                     [SVProgressHUD showInfoWithStatus:message];
               }
        }else{
              [SVProgressHUD showInfoWithStatus:@"网络不畅,请稍微尝试"];
            
        }
       
        
    }];
   
}

//data =     {
//    "created_at" = "2018-08-30 11:39:24";
//    "identity_id" = 9486;
//    "identity_name" = "\U8f66\U4e3b";
//    "identity_no" = 1001;
//    mobile = 15268117440;
//    name = "\U8c46\U82bd\U83dc";
//    status = 0;
//    token = "eyJleHAiOjE1ODM3NjIyNzMsInVzZXJfaWQiOjQ0OTcsImlkZW50aXR5X25vIjoxMDAxLCJpZGVudGl0eV9vd25lcl9pZCI6OTQ4NiwiaWRlbnRpdHlfY29tcGFueV9pZCI6IiIsImFwcF90eXBlIjoiMiJ9.uIBkB79Ap1Kn7yDzzQBGtUQ9zB9ZZQ7iDPH0Gp6cTAU";
//    uid = wQdej5;
//    "user_id" = 4497;
//    "user_info" =         {
//        "identity_id" = 9486;
//        mobile = 15268117440;
//        nickname = "\U8c46\U82bd\U83dc";
//        photo = "https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKFHtV368gxqXKTSEmZubp17zVG2hSRvJfmSaIefdIKWUG9ibpTQgPlLjkoN3niaq3xH1iceOWiaC93zQ/132";
//        sex = 1;
//    };
//};
//message = success;
//status = 0;
//"status_code" = 200;

//export async function userLogin(username, password) {
//    let login_type = "0";
//    let identity_no = 1003;
//    let dev_name = Runtime.deviceName;
//    let imei = await getDeviceid();
//    let params = {
//        username,
//        password,
//        login_type,
//        dev_name,
//        imei,
//        identity_no
//    }
//    if (RypYo.isServer()) {
//        params['app_type'] = 2;
//        params['identity_no'] = 1002;
//    }
//    let data = await UserServer.login(params);
//    console.log("登录数据", data)
//    return {
//        type: UserTypes.POST_USERLOGIN,
//        data: data || {}
//    }
//}
- (IBAction)regisBtnAction:(UIButton *)sender {

    [LatelyMetodRouter switchTopresentRegisterMetodVC:self];
}


- (IBAction)protocolBtnAction:(UIButton *)sender {

    [LatelyMetodRouter switchTopushUserPrivacyVC:self];
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


// 小写字母转大写字母
- (void)textFieldDidEndEditing:(UITextField *)textField {
    textField.text = [textField.text uppercaseString];
}
//限制中文输入 判断是否中文
+ (BOOL)isChineseCharacter:(NSString*)source {
    //参考了 https://www.jianshu.com/p/b40b3c618fec
    NSString *regex = @"^[\\u4E00-\\u9FEA]+$";
    return ([source rangeOfString:regex options:NSRegularExpressionSearch].length>0);
}
//严格限制英文输入
+ (BOOL)isEnglishCharacter:(NSString*)source {
    NSString *upperRegex = @"^[\\u0041-\\u005A]+$";
    NSString *lowerRegex = @"^[\\u0061-\\u007A]+$";
    BOOL isEnglish = (([source rangeOfString:upperRegex options:NSRegularExpressionSearch].length>0) || ([source rangeOfString:lowerRegex options:NSRegularExpressionSearch].length>0));
    return isEnglish;
}
//判断数字
+ (BOOL)isNumber:(NSString*)source {
    NSString *regex = @"^[\\u0030-\\u0039]+$";
    return ([source rangeOfString:regex options:NSRegularExpressionSearch].length>0);
}

@end
