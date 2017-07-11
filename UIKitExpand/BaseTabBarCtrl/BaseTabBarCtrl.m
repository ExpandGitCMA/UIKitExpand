//
//  BaseTabBarCtrl.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/11.
//  Copyright © 2017年 陈美安. All rights reserved.
//

#import "BaseTabBarCtrl.h"
#import "STHomeViewController.h"
#import "STSearchViewController.h"
#import "STScanSearchViewController.h"
#import "STShopCartViewController.h"
#import "STMyViewController.h"
@interface BaseTabBarCtrl ()<UITabBarDelegate>

@end

@implementation BaseTabBarCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self addSubController];
}

-(void)addSubController{

    UIButton *wisdomBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 - 30, 49-60, 60, 60)];
    wisdomBtn.userInteractionEnabled = NO;
    wisdomBtn.backgroundColor = [UIColor clearColor];
    wisdomBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    wisdomBtn.imageEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, 0);
    [wisdomBtn setImage:[UIImage imageNamed:@"Wisdom"] forState:UIControlStateNormal];
    [self.tabBar addSubview:wisdomBtn];
    
    
    STHomeViewController *homePage = [[STHomeViewController alloc]init];
    homePage.title = @"首页";
    homePage.tabBarItem.tag = 100;
    homePage.tabBarItem.image = [UIImage imageNamed:@"iconfont-home"];
    UINavigationController *navi1 = [[UINavigationController alloc]initWithRootViewController:homePage];
    
    STSearchViewController *search = [[STSearchViewController alloc]init];
    search.title = @"探索";
    search.tabBarItem.tag = 101;
    search.tabBarItem.image = [UIImage imageNamed:@"iconfont-sousuo"];
    UINavigationController *navi2 = [[UINavigationController alloc]initWithRootViewController:search];
    
    STScanSearchViewController *scan = [[STScanSearchViewController alloc]init];
    scan.tabBarItem.tag = 102;
    scan.title = @"智慧采购";
    UINavigationController *navi3 = [[UINavigationController alloc]initWithRootViewController:scan];
    
    STShopCartViewController *shopCart = [[STShopCartViewController alloc]init];
    shopCart.title = @"购物车";
    shopCart.tabBarItem.tag = 103;
    shopCart.tabBarItem.image = [UIImage imageNamed:@"iconfont-gouwuche"];
    UINavigationController *navi4 = [[UINavigationController alloc]initWithRootViewController:shopCart];
    
    STMyViewController *personal = [[STMyViewController alloc]init];
    personal.title = @"我的";
    personal.tabBarItem.tag = 104;
    personal.tabBarItem.image = [UIImage imageNamed:@"iconfont-wode"];
    UINavigationController *navi5 = [[UINavigationController alloc]initWithRootViewController:personal];
    
    self.viewControllers = @[navi1,navi2,navi3,navi4,navi5];
    
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 22)];
    imageV.image = [UIImage imageNamed:@"组-5"];
    imageV.contentMode = UIViewContentModeCenter;
    [self.tabBar addSubview:imageV];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{

    NSLog(@"%ld",item.tag);
}

- (void)tabBar:(UITabBar *)tabBar willBeginCustomizingItems:(NSArray<UITabBarItem *> *)items {

}

- (void)tabBar:(UITabBar *)tabBar didBeginCustomizingItems:(NSArray<UITabBarItem *> *)items {

}

- (void)tabBar:(UITabBar *)tabBar willEndCustomizingItems:(NSArray<UITabBarItem *> *)items changed:(BOOL)changed {

}

- (void)tabBar:(UITabBar *)tabBar didEndCustomizingItems:(NSArray<UITabBarItem *> *)items changed:(BOOL)changed{

}


@end
