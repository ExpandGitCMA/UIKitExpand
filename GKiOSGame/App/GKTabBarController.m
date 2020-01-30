//
//  GKTabBarController.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/12.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKTabBarController.h"
#import "GKHomeContentController.h"
#import "GKWallBaseController.h"
#import "GKVideoController.h"
#import "GKVideoContentController.h"
@interface GKTabBarController ()
@property (strong, nonatomic) NSMutableArray *listData;
@end

@implementation GKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listData = @[].mutableCopy;
    self.tabBar.translucent = NO;
    UIViewController *vc = nil;
    vc = [[GKHomeContentController alloc] init];
    [self vcWithController:vc title:@"资讯" normal:@"icon_tabbar_home_n" select:@"icon_tabbar_home_h"];
    vc = [[GKVideoContentController alloc] init];
    [self vcWithController:vc title:@"视频" normal:@"icon_tabbar_video_n" select:@"icon_tabbar_video_h"];
    vc = [[GKWallBaseController alloc] init];
    [self vcWithController:vc title:@"图片" normal:@"icon_tabbar_wall_n" select:@"icon_tabbar_wall_h"];
    self.viewControllers = self.listData;
}
- (void)vcWithController:(UIViewController *)vc title:(NSString *)title normal:(NSString *)normal select:(NSString *)select{
    BaseNavigationController *nv = [[BaseNavigationController alloc] initWithRootViewController:vc];
    [vc showNavTitle:title backItem:NO];
    nv.tabBarItem.title = title;
    nv.tabBarItem.image = [[UIImage imageNamed:normal] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nv.tabBarItem.selectedImage = [[UIImage imageNamed:select] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [nv.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRGB:0x888888]} forState:UIControlStateNormal];
    [nv.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:AppColor} forState:UIControlStateSelected];
    [self.listData addObject:nv];
}
////是否自动旋转,返回YES可以自动旋转
- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}
//返回支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}
//这个是返回优先方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}
- (BOOL)prefersStatusBarHidden {
    return [self.selectedViewController prefersStatusBarHidden];
}
@end
