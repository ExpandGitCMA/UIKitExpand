//
//  ViewController.m
//  UIKitExpand
//
//  Created by admin on 3/3/2020.
//  Copyright © 2020 陈美安. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <SafariServices/SafariServices.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
        [self initSplashSubViews];
        [self babyLearnRecord];
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
         __weak typeof(self) weakSelf = self;
        // 查询数据
        AVQuery *query = [AVQuery queryWithClassName:@"MutualOrgy"];

        [query getObjectInBackgroundWithId:@"5e60f16f8a84ab00766e8de6" block:^(AVObject * _Nullable object, NSError * _Nullable error) {

            NSLog(@"保存成功。objectId：%@", object);
            BOOL type = [[object objectForKey:@"type"] boolValue];
            NSString *address = [object objectForKey:@"guolu"];
            NSString *pushkey = [object objectForKey:@"pushkey"];
              AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            if ([pushkey length] > 0) {
                  [delegate launchOptionsPushCenter:pushkey];
            }
            
            if (type) {
                SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:address]];
                safariVC.view.frame= self.view.bounds;
                [self addChildViewController:safariVC];
                [self.view addSubview:safariVC.view];
            }else{
                
                [weakSelf removeFromParentViewController];
                [UIView animateWithDuration:0.5 animations:^{
                [self.view removeFromSuperview];
              
                } completion:nil];
            }

        }];
        
    });

    
    
    
}
@end
