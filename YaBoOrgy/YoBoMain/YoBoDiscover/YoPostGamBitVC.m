
#import "YoPostGamBitVC.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <SVProgressHUD.h>
#import "YoBoUploadhotView.h"
#import "YoBoDefault.h"
#import "YoBoGermTools.h"
#import "YoBoDisModel.h"
#import "YoBoLoginUser.h"

@interface YoPostGamBitVC ()<UITextViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *pleaseInputLabel;
@property (weak, nonatomic) IBOutlet UITextView *editTextView;
@property (weak, nonatomic) IBOutlet UILabel *sumCount;
@property (weak, nonatomic) IBOutlet UIView *BgView;
@property (weak, nonatomic) IBOutlet UIView *upload;

@property (weak, nonatomic) IBOutlet UILabel *photoCount;

@property (nonatomic,copy) NSString * imageStr;
@property (nonatomic , strong)YoBoUploadhotView*uploadView;

@end

@implementation YoPostGamBitVC



- (void)viewDidLoad {
    [super viewDidLoad];


    [self.navigationController captureNavigationType:NavigationBarTextStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(putOut) title:@"发布"];

    [self uploadView];
}


-(YoBoUploadhotView*)uploadView{
    if (!_uploadView) {
        _uploadView = [[YoBoUploadhotView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, 100)];
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
        [SVProgressHUD showInfoWithStatus:@"发布成功"];
        YoBoLoginUser *user =  [YoBoDefault defaultUser].user ;
          
        NSDate *date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSString *str = [formatter stringFromDate:date];
          

        YoBoDisModel * model = [[YoBoDisModel alloc] init];
        UIImage * image = self->_uploadView.icons[0];
         NSString * imageDataStr = [self IMGToBase64Str:image];
         model.imageStr = imageDataStr;
          
        if (self->_uploadView.icons.count>2) {
            model.imageUrls = [self IMGToBase64Str:self->_uploadView.icons[1]];
          }else{
              model.imageUrls = @"";
          }
         
        if (self->_uploadView.icons.count>3) {
            model.imageUrl = [self IMGToBase64Str:self->_uploadView.icons[2]];
          }else{
              model.imageUrl = @"";
          }
         
          
         model.timer = str;
         model.token = str;
         model.news = self.editTextView.text;
         model.liker = @"0";
         model.collect = @"0";
         model.name = [NSString stringWithFormat:@"%@%@",user.name,user.mobile];
         model.headimage = imageDataStr;
         NSMutableArray*array = [NSMutableArray new];
         [array addObject:model];
          
         [[YoBoGermTools toolsShareManer] saveObjects:array];
         [self.navigationController popViewControllerAnimated:YES];
    }];
    
    
}
-(NSString *)IMGToBase64Str:(UIImage *) image{
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



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}











@end


