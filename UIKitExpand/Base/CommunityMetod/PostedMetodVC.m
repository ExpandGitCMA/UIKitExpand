
#import "PostedMetodVC.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <SVProgressHUD.h>
#import "UploadScreenshotView.h"
#import "UserDefaultManager.h"
#import "DisGermTools.h"
#import "DisBamboo.h"
@interface PostedMetodVC ()<UITextViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *pleaseInputLabel;
@property (weak, nonatomic) IBOutlet UITextView *editTextView;
@property (weak, nonatomic) IBOutlet UILabel *sumCount;
@property (weak, nonatomic) IBOutlet UIView *BgView;
@property (weak, nonatomic) IBOutlet UIView *upload;

@property (weak, nonatomic) IBOutlet UILabel *photoCount;
@property (nonatomic,strong)NSMutableArray * dataArr;
@property (nonatomic,copy) NSString * imageStr;
@property (nonatomic , strong)UploadScreenshotView*uploadView;

@end

@implementation PostedMetodVC



- (void)viewDidLoad {
    [super viewDidLoad];


    [self.navigationController captureNavigationType:NavigationBarTextStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(putOut) title:@"发布"];

    
    [self uploadView];
}


-(UploadScreenshotView*)uploadView{
    if (!_uploadView) {
        _uploadView = [[UploadScreenshotView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, 100)];
        _uploadView.maxCount = 3;
        __weak typeof(self) weakSelf = self;
        [_uploadView setCountBlock:^(NSInteger maxCount) {
          weakSelf.photoCount.text = [NSString stringWithFormat:@"%@%ld%@",@"最多上传",maxCount,@"/3"];
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
    
    [SVProgressHUD show];
    UIImage * image = _uploadView.icons[0];
    
    NSData * imageData = UIImagePNGRepresentation(image);
    AVUser *currentuser = [AVUser currentUser];
    AVFile *avatarFile = [AVFile fileWithData:imageData];
    [currentuser setObject:avatarFile forKey:@"avatar"];
    [currentuser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        [SVProgressHUD showInfoWithStatus:@"发布成功,审核通过会显示在社区"];
        User *user =  [UserDefaultManager sharedDefaultManager].user ;
          
          NSDate *date = [NSDate date];
          NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
          [formatter setDateFormat:@"yyyy-MM-dd"];
          NSString *str = [formatter stringFromDate:date];
          
          
         DisBamboo * model = [[DisBamboo alloc] init];
        
         UIImage * image = _uploadView.icons[0];
         NSString * imageDataStr = [self UIImageToBase64Str:image];
         model.dataImageStr = imageDataStr;
          
          if (_uploadView.icons.count>2) {
              model.dataImageUrls = [self UIImageToBase64Str:_uploadView.icons[1]];
          }else{
              model.dataImageUrls = @"";
          }
         
          if (_uploadView.icons.count>3) {
              model.dataImageUrl = [self UIImageToBase64Str:_uploadView.icons[2]];
          }else{
              model.dataImageUrl = @"";
          }
         
          
         model.dateStr = str;
         model.token = str;
         model.news = self.editTextView.text;
         model.liker = @"0";
         model.collect = @"0";
         model.name = [NSString stringWithFormat:@"%@%@",user.name,user.mobile];
         model.headimageStr = imageDataStr;
         NSMutableArray*array = [NSMutableArray new];
         [array addObject:model];
          
         [[DisGermTools slidingDiaryShare] saveObjects:array];
         [self.navigationController popViewControllerAnimated:YES];
    }];
    
    
}
-(NSString *)UIImageToBase64Str:(UIImage *) image
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
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


