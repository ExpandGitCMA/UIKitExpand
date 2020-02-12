#import "YaBoTabBarVC.h"
#import "YaBoMesVC.h"
#import "YaBoHomeVC.h"
#import "YoBoDiscover.h"
@interface YaBoTabBarVC ()<UITabBarDelegate>
@property(nonatomic,strong)NSMutableArray*tabBarSource;
@end
@implementation YaBoTabBarVC




-(NSMutableArray*)tabBarSource{
    if (!_tabBarSource) {
        _tabBarSource = [NSMutableArray new];
    }
    return _tabBarSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubController];
}


-(void)initSubController{
    YaBoHomeVC *homePage = [YaBoHomeVC new];
    [self tabBarControllers:homePage  title:@"体育资讯" imageUrl:@"icon-home-new"];
    YoBoDiscover *score = [YoBoDiscover new];
    [self tabBarControllers:score title:@"发现" imageUrl:@"score"];
    YaBoMesVC *personal = [YaBoMesVC new];
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

- (void)tabBar:(UITabBar *)tabBar willBeginCustomizingItems:(NSArray<UITabBarItem *> *)items {
    
}

- (void)tabBar:(UITabBar *)tabBar didBeginCustomizingItems:(NSArray<UITabBarItem *> *)items {
    
}

- (void)tabBar:(UITabBar *)tabBar willEndCustomizingItems:(NSArray<UITabBarItem *> *)items changed:(BOOL)changed {
    
}

- (void)tabBar:(UITabBar *)tabBar didEndCustomizingItems:(NSArray<UITabBarItem *> *)items changed:(BOOL)changed{
    
}

@end
