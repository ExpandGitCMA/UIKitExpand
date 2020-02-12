#import "YaBoTabBarVC.h"
#import "YaBoMesVC.h"
#import "YaBoHomeVC.h"
#import "YaBoScoreVC.h"
@interface YaBoTabBarVC ()<UITabBarDelegate>
@property(nonatomic,strong)NSMutableArray*tabBarSource;
@end
@implementation YaBoTabBarVC
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
    YaBoHomeVC *homePage = [YaBoHomeVC new];
    [self tabBarControllers:homePage  title:@"体育资讯" imageUrl:@"icon-home-new"];
    YaBoScoreVC *score = [YaBoScoreVC new];
    [self tabBarControllers:score title:@"足球小知识" imageUrl:@"score"];
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
