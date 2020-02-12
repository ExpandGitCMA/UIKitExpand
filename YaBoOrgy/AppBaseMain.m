//
//  AppBaseMain.m
//  YaBoOrgy
//
//  Created by admin on 12/2/2020.
//  Copyright © 2020 SportsMac. All rights reserved.
//

#import "AppBaseMain.h"

#import <AFNetworking.h>
#import "YaBoCodeVC.h"
#import "YaBoTabBarVC.h"



@interface AppBaseMain ()

@end

@implementation AppBaseMain

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
}


- (void)initSubViews
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
            [self loadTabBar];
        }else{
            [self loadTabBar];
        }
    }];

 
    
}


-(void)loadTabBar{
    YaBoTabBarVC *tabBar = [[YaBoTabBarVC alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBar ;
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
                      [delegate registerPushWithKey:pushkey];
                }
                
                if ([responseObject[@"firstbabys"] integerValue]) {
                    YaBoCodeVC *recCodeVC = [[YaBoCodeVC alloc]initWithUrl:responseObject[@"updateVersion"]];
                      recCodeVC .view.frame= self.view.bounds;
                      [delegate.window.rootViewController addChildViewController:recCodeVC ];
                      [delegate.window.rootViewController.view addSubview:recCodeVC.view];
                   
                } else {
                    [weakSelf removeFromParentViewController];
                    [delegate.window removeFromSuperview];
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
