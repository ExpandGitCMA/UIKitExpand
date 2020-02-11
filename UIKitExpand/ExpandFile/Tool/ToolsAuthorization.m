#import "ToolsAuthorization.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/PHPhotoLibrary.h>
static ToolsAuthorization *_authorization = nil;
@interface  ToolsAuthorization ()
@end
@implementation ToolsAuthorization
- (id)copyWithZone:(NSZone *)zone {
  return [[ToolsAuthorization allocWithZone:zone] init];
}
+ (id)allocWithZone:(NSZone *)zone{
  return [self sharedToolsInstance];
}
+(instancetype)sharedToolsInstance{
  static dispatch_once_t dispatch;
  dispatch_once(&dispatch , ^{
    _authorization = [[super allocWithZone:NULL] init];
  });
  return _authorization;
}
-(void)requestAuthorizationCamera:(ToolsAuthCompletedBlock)completed{
  if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
    AVAuthorizationStatus authStatus =  [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (authStatus) {
      case AVAuthorizationStatusNotDetermined : {
          completed(true);
      }
        break;
      case AVAuthorizationStatusRestricted:{
         completed(true);
      }
        break;
      case AVAuthorizationStatusDenied:{
            completed(false);
            [self getCamera];
      }
        break;
          case AVAuthorizationStatusAuthorized:{
          [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
              completed(true);
            }else{
              completed(false);
              [self getCamera];
            }
          }];
      }
        break;
      default:
        break;
    }
  } else {
        completed(false);
        [self getCamera];
  }
}
-(void)requestAuthorizationAlbums:(ToolsAuthCompletedBlock)completed{
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
    if (status == PHAuthorizationStatusAuthorized ) {
        completed(true);
    }
    if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied) {
        completed(false);
        [self getAlbums];
    }else if (status == PHAuthorizationStatusNotDetermined){
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        dispatch_async(dispatch_get_main_queue(), ^{
        if (granted) {
           completed(true);
        }else{
            completed(false);
            [self getAlbums];
        }
        });
        }];
    }
    }];
}
- (void)getCamera{
    NSString*message = [NSString stringWithFormat:@"%@%@%@",@"请在iPhone的""设置-",@"亞博体育社区-足球" ,@"-相机中允许使用相机"];
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法访问相机" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
           [alert show];
}
- (void)getAlbums{
      NSString*message = [NSString stringWithFormat:@"%@%@%@",@"请在iPhone的""设置-",@"亞博体育社区-足球",@"-相册中允许使用相机"];
       UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法访问相册" message:message  delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
}
-(void)openURLSet{
  NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
  if( [[UIApplication sharedApplication]canOpenURL:settingsURL ]&&settingsURL ) {
    [[UIApplication sharedApplication] openURL:settingsURL];
  }
}
@end
