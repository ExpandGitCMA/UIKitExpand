#import "BaseTabBarMetod.h"
#import "HomeMetodVC.h"
#import "RuleMetodVC.h"
#import "CommunityVC.h"
#import "UsCenterMetodVC.h"


@interface BaseTabBarMetod ()<UITabBarDelegate>
@property(nonatomic,strong)NSMutableArray*tabBarSource;
@property(nonatomic,strong)UIButton *wisdom;
@property(nonatomic,strong)UIImageView *tabBarBg;
@property (nonatomic,assign) NSInteger  indexFlag;;
@end


@implementation BaseTabBarMetod

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
}

-(void)addSubController{
    CommunityVC *communityVC = [CommunityVC new];
    [self tabBarControllers:communityVC title:@"社区" imageUrl:@"discover"];
    HomeMetodVC *homePage = [HomeMetodVC new];
    [self tabBarControllers:homePage  title:@"首页" imageUrl:@"icon-home"];
    UsCenterMetodVC *personal = [UsCenterMetodVC new];
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
