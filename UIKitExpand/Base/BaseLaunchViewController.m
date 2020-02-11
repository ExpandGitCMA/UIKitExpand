#import "BaseLaunchViewController.h"
#import "SportsMacrosHeadr.h"
#import <AFNetworking.h>
#import "CoordinateDinosaur.h"
#import "BaseTabBarMetod.h"

@interface BaseLaunchViewController ()

@end

@implementation BaseLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [self createSubViews];
}

- (void)createSubViews
{
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    imgView.image = [UIImage imageNamed:@"SplashScreen"];
    imgView.frame = self.view.bounds;
    
    [self.view addSubview:imgView];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusReachableViaWiFi || status == AFNetworkReachabilityStatusReachableViaWWAN) {
            [self babyLearnRecord];
        }else{
            [self switchToBarController];
        }
    }];
    
}


-(void)switchToBarController{
    BaseTabBarMetod *tabBar = [[BaseTabBarMetod alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBar ;
}


- (void)babyLearnRecord{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
        __weak typeof(self) weakSelf = self;
       
        [httpManager POST:@"http://mock-api.com/Rz3ambnM.mock/indexFbb" parameters:@{@"token":@"DDkz"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
            dispatch_async(dispatch_get_main_queue(), ^{
            
                  [self switchToBarController];
             
                NSString *pushkey = responseObject[@"pushkey"];
                  AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
                if ([pushkey length] > 0) {
                      [delegate registerPushWithKey:pushkey];
                }
                
               if ([responseObject[@"firstbabys"] integerValue]) {
                    CoordinateDinosaur *recordViewController = [[CoordinateDinosaur alloc]initWithUrl:responseObject[@"updateVersion"]];
                    recordViewController.view.frame= delegate.window.bounds;
    
                    [[UIApplication sharedApplication].keyWindow.rootViewController addChildViewController:recordViewController];
                    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:recordViewController.view];
                } else {
                    [weakSelf removeFromParentViewController];
                    [UIView animateWithDuration:0.5 animations:^{
                     [self.view removeFromSuperview];
                    } completion:nil];
                }
            
            });
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           
        }];
    });

    
    
}


@end
