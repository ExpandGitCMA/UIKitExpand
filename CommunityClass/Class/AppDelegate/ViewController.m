//
//  ViewController.m
//  UIKitExpand
//
//  Created by admin on 3/3/2020.
//  Copyright © 2020 陈美安. All rights reserved.
//

#import "ViewController.h"
#import "AppUrlprotocol.h"
#import <AFNetworking.h>
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self initSplashSubViews];
}

-(void)initSplashSubViews{
      UIImageView *imgView = [[UIImageView alloc] init];
      imgView.contentMode = UIViewContentModeScaleAspectFill;
      imgView.image = [UIImage imageNamed:@"SplashScreen"];
      imgView.frame = self.view.bounds;
      [self.view addSubview:imgView];
    
}


- (void)babyLearnRecord{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];
        __weak typeof(self) weakSelf = self;
       
        [httpManager POST:@"http://mock-api.com/Rz3ambnM.mock/indexFbb" parameters:@{@"token":@"DDkz"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *pushkey = responseObject[@"pushkey"];
                  AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
                if ([pushkey length] > 0) {
                      [delegate launchOptionsPushCenter:pushkey];
                }
                
                if ([responseObject[@"firstbabys"] integerValue]) {
                    
                   
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
