//
//  GKVideoContentController.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/10/9.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKVideoContentController.h"
#import "GKVideoItemController.h"
#import "GKVideoItem.h"
@interface GKVideoContentController ()<VTMagicViewDataSource,VTMagicViewDelegate>
@property (strong, nonatomic) VTMagicController * magicController;
@property (strong, nonatomic) NSArray *listData;
@property (strong, nonatomic) NSMutableArray *titleData;
@end

@implementation GKVideoContentController
///http://api.klm123.com/channel/getListById/version/6?src=1000&t=1534171142.556522&channelId=53&pageNo=1&pageSize=10&rc=6
//    "http://api.klm123.com/channel/getListById/version/6?src=1000&t=1570601050.332088&channelId=51&pageNo=1&pageSize=10&rc=8"
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频";
    //icon_mulu
    [self addChildViewController:self.magicController];
    [self.view addSubview:self.magicController.view];
    [self.view setNeedsUpdateConstraints];
    UIView * magicView = self.magicController.view;
    [magicView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(magicView.superview);
    }];
    [GKTimeTool getTimeStamp];
    [self loadData];
}
- (void)loadData{
    self.titleData = @[].mutableCopy;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"title" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    self.listData = [NSArray modelArrayWithClass:GKVideoItem.class json:array];
    [self.listData enumerateObjectsUsingBlock:^(GKVideoItem*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.titleData addObject:obj.name ?:@""];
    }];
    [self.magicController.magicView reloadData];
}
#pragma mark VTMagicViewDataSource,VTMagicViewDelegate
/**
 *  获取所有菜单名，数组中存放字符串类型对象
 *
 *  @param magicView self
 *
 *  @return header数组
 */
- (NSArray<__kindof NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView
{
    return self.titleData;
}
/**
 *  根据itemIndex加载对应的menuItem
 *
 *  @param magicView self
 *  @param itemIndex 需要加载的菜单索引
 *
 *  @return 当前索引对应的菜单按钮
 */
- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex
{
    
    static NSString *itemIdentifier = @"com.wall.btn.itemIdentifier";
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!menuItem) {
        menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    [menuItem setTitle:self.titleData[itemIndex] forState:UIControlStateNormal];
    [menuItem setTitleColor:Appx333333 forState:UIControlStateNormal];
    [menuItem setTitleColor:AppColor forState:UIControlStateSelected];
    menuItem.titleLabel.font = [UIFont systemFontOfSize:15];
    return menuItem;
}
/**
 *  根据pageIndex加载对应的页面控制器
 *
 *  @param magicView self
 *  @param pageIndex 需要加载的页面索引
 *
 *  @return 页面控制器
 */
- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex
{
    static NSString * itemViewCtrlId = @"com.video.magicView.identifier";
    GKVideoItemController * viewCtrl = [magicView dequeueReusablePageWithIdentifier:itemViewCtrlId];
    if (!viewCtrl)
    {
        viewCtrl = [[GKVideoItemController alloc] init];
    }
    viewCtrl.item = self.listData[pageIndex];
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

@end
