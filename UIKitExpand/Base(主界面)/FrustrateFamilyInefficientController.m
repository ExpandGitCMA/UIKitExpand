//
//  ViewController.m
//  my
//
//  Created by soso-mac on 2016/11/21.
//  Copyright © 2016年 soso-mac. All rights reserved.
//

#import "FrustrateFamilyInefficientController.h"
#import "FlatterSlightRhythm.h"
#import "SlopeButBenefit.h"
#import "BendInformalProvince.h"
#import "WeaveAboutCheekboneManager.h"
#import "ExpanFileConstants.h"
#import "AlternativeSkull.h"
#import "IncreaseGraveAlcoholic.h"

#import "NSString+IMAdditions.h"

@interface FrustrateFamilyInefficientController ()
@property (nonatomic,strong) SlopeButBenefit *search;//搜索框
@property (nonatomic,strong) UIView *titleView;
@property (strong,nonatomic) UIButton *msgBtn; //导航栏的消息按钮
@property (assign,nonatomic)NSInteger page;   // 页面
@end

#define Search_width 115
#define Search_height  40

@implementation FrustrateFamilyInefficientController

- (instancetype)init
{
    self = [super init];
    if (self) {
          [self search];
  
    }
    return self;
}

-(void)whisk{
    
    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavLeftStyle barTarget:self action:@selector(whiskClick) title:@"category_camera_7_gray"];
    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(msgClick) title:@"msg_home"];
}


-(SlopeButBenefit*)search{
    if (_search==nil) {
        _search = [[SlopeButBenefit alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH- Search_width, Search_height)];
        [_search addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.titleView = _search;
    }
    return _search;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self whisk];

//    NSString*md5 = @"apiKey=40287ae447680a6b0147680a6b580000&businessType=qcwdapp&clientApp=app10&timestamp=1507694616";
//    
//    //apiKey=40287ae447680a6b0147680a6b580000&businessType=qcwdapp&clientApp=app10&timestamp=1507694616
//    NSString *appKey = [md5 MD5];
//    NSLog(@"%@",appKey);



}


#pragma mark 点击搜索框点击事件
- (void)searchClick{
    
  
    
    NSString *urlStr =@"https://itunes.apple.com/cn/app/车架号查询/id1436029165";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[urlStr urlEncodedString]]];
}


-(void)whiskClick{

}

#pragma mark - 点击消息按钮
- (void)msgClick {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


