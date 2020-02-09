
#import "PostedMetodVC.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <SVProgressHUD.h>
#import "CJWUploadScreenshotView.h"
#import "UserDefaultManager.h"
@interface PostedMetodVC ()<UITextViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *pleaseInputLabel;
@property (weak, nonatomic) IBOutlet UITextView *editTextView;
@property (weak, nonatomic) IBOutlet UILabel *sumCount;
@property (weak, nonatomic) IBOutlet UIView *BgView;
@property (weak, nonatomic) IBOutlet UIView *upload;

@property (weak, nonatomic) IBOutlet UILabel *photoCount;
@property (nonatomic,strong)NSMutableArray * dataArr;
@property (nonatomic,copy) NSString * imageStr;
@property (nonatomic , strong)CJWUploadScreenshotView*uploadView;

@end

@implementation PostedMetodVC



- (void)viewDidLoad {
    [super viewDidLoad];


    [self.navigationController captureNavigationType:NavigationBarTextStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(putOut) title:@"发布"];

    
    [self uploadView];
}


-(CJWUploadScreenshotView*)uploadView{
    if (!_uploadView) {
        _uploadView = [[CJWUploadScreenshotView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, 100)];
        _uploadView.maxCount = 5;
        __weak typeof(self) weakSelf = self;
        [_uploadView setCountBlock:^(NSInteger maxCount) {
          weakSelf.photoCount.text = [NSString stringWithFormat:@"%@%ld%@",@"最多上传",maxCount,@"/4"];
         }];
        [self.upload addSubview:_uploadView];
    }
    return _uploadView;
}

-(void)putOut{
    
    if (self.editTextView.text.length == 0) {
          
           [SVProgressHUD showInfoWithStatus:@"请输入文字"];
          return;
     }
           
    if (_uploadView.icons.count == 1) {
        [SVProgressHUD showInfoWithStatus:@"请选择图片"];
        return;
    }
    
     User *user =  [UserDefaultManager sharedDefaultManager].user ;
    
        NSDictionary*dict = @{
                 @"token":user.uid,
                 @"uid":user.token
        };
     

     DEBUG_NSLog(@"=========dict %@",dict);
     [SVProgressHUD show];

     [[HttpNetWorkManager sharedManager] requestWithMetod:URL_Signout params:dict completed:^(BOOL ret, id obj) {

        [SVProgressHUD showInfoWithStatus:@"发布成功,审核通过会显示在社区话题"];
         [self.navigationController popViewControllerAnimated:YES];
        

     }];

    DEBUG_NSLog(@"=======>%@",_uploadView.icons )
    
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    
    return YES;
}


- (void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length == 0) {
        self.pleaseInputLabel.hidden = NO;
    }else{
        self.pleaseInputLabel.hidden = YES;
    }
    if (textView.text.length > 600) {
        self.editTextView.text = [textView.text substringToIndex:599];
    }
    NSInteger num = self.editTextView.text.length;
    self.sumCount.text = [NSString stringWithFormat:@"%ld/600",(long)num];
}


- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}











@end


