#import "FrustrateFamilyInefficientController.h"
#import "FlatterSlightRhythm.h"
#import "SlopeButBenefit.h"
#import "BendInformalProvince.h"
#import "WeaveAboutCheekboneManager.h"
#import "ExpanFileConstants.h"
#import "AlternativeSkull.h"
#import "IncreaseGraveAlcoholic.h"
#import "NSString+IMAdditions.h"
@interface FrustrateFamilyInefficientController ()
@property (nonatomic,strong) SlopeButBenefit *search;
@property (nonatomic,strong) UIView *titleView;
@property (strong,nonatomic) UIButton *msgBtn; 
@property (assign,nonatomic)NSInteger page;   
@end
#define Search_width 115
#define Search_height  40
@implementation FrustrateFamilyInefficientController
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
-(SlopeButBenefit*)search{
    if (_search==nil) {
        _search = [[SlopeButBenefit alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH- Search_width, Search_height)];
        [_search addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.titleView = _search;
    }
    return _search;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self whisk];
}
#pragma mark 点击搜索框点击事件
- (void)searchClick{
    NSString *urlStr =@"https://itunes.apple.com/cn/app/车架号查询/id1436029165";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[urlStr urlEncodedString]]];
}
-(void)whiskClick{
}
#pragma mark - 点击消息按钮
- (void)msgClick {
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
