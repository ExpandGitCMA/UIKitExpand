#import "GKHomeContentController.h"
#import "GKHomeItemController.h"
@interface GKHomeContentController ()<VTMagicViewDataSource,VTMagicViewDelegate>
@property (strong, nonatomic) VTMagicController * magicController;
@property (strong, nonatomic) NSMutableArray *listTitles;
@property (strong, nonatomic) NSArray *listSubTitle;
@property (strong, nonatomic) UIButton *editorBtn;
@end
@implementation GKHomeContentController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"资讯";
    [self addChildViewController:self.magicController];
    [self.view addSubview:self.magicController.view];
    [self.view setNeedsUpdateConstraints];
    UIView * magicView = self.magicController.view;
    [magicView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(magicView.superview);
    }];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.editorBtn];
    [self loadData];
}
- (void)loadData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"App" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    self.listSubTitle = [NSArray modelArrayWithClass:GKHomeItem.class json:array];
    self.listTitles = @[].mutableCopy;
    [self.listSubTitle enumerateObjectsUsingBlock:^(GKHomeItem*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.listTitles addObject:obj.title?:@""];
    }];
    [self.magicController.magicView reloadData];
}
#pragma mark VTMagicViewDataSource,VTMagicViewDelegate
- (NSArray<__kindof NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView
{
    return self.listTitles;
}
- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex
{
    static NSString *itemIdentifier = @"com.wall.btn.itemIdentifier";
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!menuItem) {
        menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    [menuItem setTitle:self.listTitles[itemIndex] forState:UIControlStateNormal];
    [menuItem setTitleColor:Appx333333 forState:UIControlStateNormal];
    [menuItem setTitleColor:AppColor forState:UIControlStateSelected];
    menuItem.titleLabel.font = [UIFont systemFontOfSize:15];
    return menuItem;
}
- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex
{
    static NSString * itemViewCtrlId = @"com.new.magicView.identifier";
    GKHomeItemController * viewCtrl = [magicView dequeueReusablePageWithIdentifier:itemViewCtrlId];
    if (!viewCtrl)
    {
        viewCtrl = [[GKHomeItemController alloc] init];
    }
    viewCtrl.item = self.listSubTitle[pageIndex];
    return viewCtrl;
}
#pragma mark get
-(VTMagicController *)magicController {
    if (!_magicController) {
        _magicController = [[VTMagicController alloc] init];
        _magicController.magicView.separatorHeight = 0.50f;
        _magicController.magicView.separatorColor = [UIColor colorWithRGB:0xdddddd];
        _magicController.magicView.backgroundColor = [UIColor whiteColor];
        _magicController.magicView.navigationInset = UIEdgeInsetsMake(0,5, 0,5);
        _magicController.magicView.navigationColor = [UIColor whiteColor];
        _magicController.magicView.switchStyle = VTSwitchStyleDefault;
        _magicController.magicView.sliderColor = AppColor;
        _magicController.magicView.sliderExtension = 1.5;
        _magicController.magicView.bubbleRadius = 1.5;
        _magicController.magicView.sliderWidth = 35;
        _magicController.magicView.layoutStyle = VTLayoutStyleDefault;
        _magicController.magicView.navigationHeight = 35.0;
        _magicController.magicView.sliderHeight = 3.0;
        _magicController.magicView.itemSpacing = 30;
        _magicController.magicView.againstStatusBar = NO;
        _magicController.magicView.dataSource = self;
        _magicController.magicView.delegate = self;
        _magicController.magicView.itemScale = 1.15f;
        _magicController.magicView.needPreloading = true;
        _magicController.magicView.bounces = false;
    }
    return _magicController;
}
- (UIButton *)editorBtn
{
    if (!_editorBtn) {
        _editorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editorBtn setFrame:CGRectMake(0, 0, 44, 44)];
        [_editorBtn setImage:[UIImage imageNamed:@"icon_mulu"] forState:UIControlStateNormal];
        [_editorBtn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
        [_editorBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    }
    return _editorBtn;
}
- (void)leftAction{
    [self.viewDeckController openSide:IIViewDeckSideLeft animated:YES];
}
@end
