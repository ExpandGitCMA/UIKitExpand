//
//  ViewController.m
//  my
//
//  Created by soso-mac on 2016/11/21.
//  Copyright © 2016年 soso-mac. All rights reserved.
//

#import "STHomeViewController.h"
#import "DFCTextFieldSearch.h"
#import "ExpandSearch.h"
#import "ExpandBar.h"
#import "HttpRequestManager.h"
#import "ExpanFileConstants.h"
#import "ExNSUserDefault.h"
#import "MD5.h"
@interface STHomeViewController ()
@property (nonatomic,strong) ExpandSearch *search;//搜索框
@property (nonatomic,strong) UIView *titleView;
@property (strong,nonatomic) UIButton *msgBtn; //导航栏的消息按钮
@property (assign,nonatomic)NSInteger page;   // 页面
@end

#define Search_width 115
#define Search_height  40

@implementation STHomeViewController

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


-(ExpandSearch*)search{
    if (_search==nil) {
        _search = [[ExpandSearch alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH- Search_width, Search_height)];
        [_search addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.titleView = _search;
    }
    return _search;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self whisk];

    NSString*md5 = @"apiKey=40287ae447680a6b0147680a6b580000&businessType=qcwdapp&clientApp=app10&timestamp=1507694616";
    
    //apiKey=40287ae447680a6b0147680a6b580000&businessType=qcwdapp&clientApp=app10&timestamp=1507694616
    NSString *appKey = [md5 MD5];
    NSLog(@"%@",appKey);

    
//    NSLog(@"%@",AGEKEY);
//    [self.navigationController.navigationBar.subviews[0] setAlpha:0.0];
    //self.navigationController.navigationBar.hidden = YES;

    
   // [[ExNSUserDefault sharedDefaultManager]saveUserKeyNamed:params];
    

//    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    [params SafetySetObject:@1 forKey:@"call"];
//    [params SafetySetObject:[NSNumber numberWithInteger:_page] forKey:@"page"];
//    @weakify(self)
//    [[HttpRequestManager manager] requestPostWithPath:URL_AppHocus    params:params completed:^(BOOL ret, id obj) {
//        @strongify(self)
//        if (ret) {
//            DEBUG_NSLog(@"obj===%@",obj);
//        } else {
//            DEBUG_NSLog(@"obj==%@",obj);
//        }
//    }];


}


#pragma mark 点击搜索框点击事件
- (void)searchClick{
    


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
