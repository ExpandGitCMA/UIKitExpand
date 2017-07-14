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
@interface STHomeViewController ()
@property (nonatomic,strong) ExpandSearch *search;//搜索框
@property (nonatomic,strong) UIView *titleView;
@property (strong,nonatomic) UIButton *msgBtn; //导航栏的消息按钮
@end

#define Search_width 115
#define Search_height  28

@implementation STHomeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
          [self search];
          [self whisk];
    }
    return self;
}

-(void)whisk{
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[UIImage
                  imageNamed:@"category_camera_7_gray"] style: UIBarButtonItemStylePlain
                target:self action:@selector(whiskClick)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage
                    imageNamed:@"msg_home"] style: UIBarButtonItemStylePlain
                    target:self action:@selector(msgClick)];
    
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
    
}


#pragma mark 点击搜索框点击事件
- (void)searchClick{
    NSLog(@"点击搜索框点击事件");
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
