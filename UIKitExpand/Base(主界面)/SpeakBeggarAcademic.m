//
//  SpeakBeggarAcademic.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/11.
//  Copyright © 2017年 陈美安. All rights reserved.
//

#import "SpeakBeggarAcademic.h"
#import "FrustrateFamilyInefficientController.h"
#import "BestMannerController.h"
#import "RespectiveButterflyController.h"
#import "DisposeOverweightFakeController.h"
#import "InvadeHollowCabbageController.h"

@interface SpeakBeggarAcademic ()<UITabBarDelegate>
@property(nonatomic,strong)NSMutableArray*tabBarSource;
@property(nonatomic,strong)UIButton *wisdom;
@property(nonatomic,strong)UIImageView *tabBarBg;
@end

#define wisdom_width  60
#define wisdom_height 60
#define systemic_height 49
@implementation SpeakBeggarAcademic

- (instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"开启启动了哦");
        [self addSubController];
    }
    return self;
}

-(NSMutableArray*)tabBarSource{
    if (!_tabBarSource) {
        _tabBarSource = [NSMutableArray new];
    }
    return _tabBarSource;
}

-(UIButton*)wisdom{
    if (!_wisdom) {
        _wisdom = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-wisdom_width)/2, systemic_height-wisdom_height, wisdom_width, wisdom_height)];
        _wisdom.userInteractionEnabled = NO;
        _wisdom.backgroundColor = [UIColor clearColor];
        _wisdom.titleLabel.font = [UIFont systemFontOfSize:10];
        _wisdom.imageEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, 0);
        [_wisdom setImage:[UIImage imageNamed:@"Wisdom"]forState:UIControlStateNormal];
        _wisdom.contentMode =  UIViewContentModeCenter;
        [self.tabBar addSubview:_wisdom];
    }
    return _wisdom;
}

-(UIImageView*)tabBarBg{
    if (!_tabBarBg) {
        _tabBarBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 22)];
        _tabBarBg.image = [UIImage imageNamed:@"组-5"];
       _tabBarBg.contentMode = UIViewContentModeCenter;
        [self.tabBar addSubview:_tabBarBg];
    }
    return _tabBarBg;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)addSubController{

    FrustrateFamilyInefficientController *homePage = [[FrustrateFamilyInefficientController alloc]init];
    [self tabBarControllers:homePage title:@"首页" imageUrl:@"icon-home"];

    BestMannerController *search = [[BestMannerController alloc]init];
    [self tabBarControllers:search title:@"分类" imageUrl:@"icon-search"];

    RespectiveButterflyController *scan = [[RespectiveButterflyController alloc]init];
    [self tabBarControllers:scan title:@"发现" imageUrl:@"news_1"];
    
    InvadeHollowCabbageController *personal = [[InvadeHollowCabbageController alloc]init];
    [self tabBarControllers:personal title:@"我的" imageUrl:@"icon-account"];

    self.viewControllers = [self.tabBarSource copy];
}


-(void)tabBarControllers:(UIViewController*)controller title:(NSString*)title imageUrl:(NSString*)imageUrl{
    controller.title = title;
    
    controller.tabBarItem.image = [UIImage imageNamed:imageUrl];
    UINavigationController *tabBar = [[UINavigationController alloc]initWithRootViewController:controller];
    [self.tabBarSource addObject:tabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
     NSLog(@"%@",item.title);
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


