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
- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}
- (BOOL)prefersStatusBarHidden {
    return [self.selectedViewController prefersStatusBarHidden];
}
@end
