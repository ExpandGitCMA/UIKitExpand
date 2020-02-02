//
//  NewsSportsTabBarVC.m
//  UIKitExpand
//
//  Created by Smell Zero on 2020/2/1.
//  Copyright © 2020 陈美安. All rights reserved.
//

#import "NewsSportsTabBarVC.h"
#import "PourConsciousnessPassiveController.h"
#import "BriefThornController.h"
#import "ReportZealHandyController.h"
#import "HowUnlikelyUsageController.h"
#import "RetellFingernailController.h"
#import "NewsSportsHomeVC.h"

@interface NewsSportsTabBarVC ()<UITabBarDelegate>
@property(nonatomic,strong)NSMutableArray*tabBarSource;

@end

@implementation NewsSportsTabBarVC

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


- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void)addSubController{
    NewsSportsHomeVC *homePage = [[NewsSportsHomeVC alloc]init];
    [self tabBarControllers:homePage  title:@"推荐" imageUrl:@"icon-home-new"];
    BriefThornController *score = [[BriefThornController alloc]init];
    [self tabBarControllers:score title:@"规则" imageUrl:@"score"];
    RetellFingernailController *personal = [[RetellFingernailController alloc]init];
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
}
#pragma mark - UITabBarDelegate
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
}
-(void)beginAnimation{
       NSInteger indext ;
        NSMutableArray *arry = [NSMutableArray array];
           for (UIView *btn in self.tabBar.subviews) {
               if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                    [arry addObject:btn];
               }
        }
       UIView *btnView = [arry objectAtIndex: indext];
       CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
        animation.values = @[@0.0, @-4.15, @-7.26, @-9.34, @-10.37, @-9.34, @-7.26, @-4.15, @0.0, @2.0, @-2.9, @-4.94, @-6.11, @-6.42, @-5.86, @-4.44, @-2.16, @0.0];
        animation.duration = 0.8;
        animation.beginTime = CACurrentMediaTime()+1;
        [btnView.layer addAnimation:animation forKey:nil];
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
