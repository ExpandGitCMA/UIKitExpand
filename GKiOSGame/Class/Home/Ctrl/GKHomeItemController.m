//
//  GKHomeItemController.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/11.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKHomeItemController.h"
#import "GKHomeItemDetailController.h"
#import "GKHomeBannerView.h"
#import "GKHomeItemCell.h"
@interface GKHomeItemController ()
@property (strong, nonatomic) NSMutableArray *listData;
@property (strong, nonatomic) GKHomeModel *model;
@end

@implementation GKHomeItemController
- (void)vtm_prepareForReuse{
    if (!self.reachable) {
        [self.listData removeAllObjects];
        [self.tableView reloadData];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.listData = @[].mutableCopy;
    [self setupEmpty:self.tableView];
    [self setupRefresh:self.tableView option:ATRefreshDefault];
    [self.tableView registerClass:GKHomeBannerView.class forHeaderFooterViewReuseIdentifier:NSStringFromClass(GKHomeBannerView.class)];
    // Do any additional setup after loading the view.
}
- (void)setItem:(GKHomeItem *)item{
    _item = item;
    [self.tableView setContentOffset:CGPointMake(0,0) animated:NO];
    [self refreshData:1];
}
- (void)refreshData:(NSInteger)page{
    [GKHomeNetManager home:self.item page:page-1 success:^(id  _Nonnull object) {
        GKHomeModel *info = [GKHomeModel modelWithJSON:object];
        if (page == 1) {
            self.model = info;
            [self.listData removeAllObjects];
        }
        if (info.list) {
            [self.listData addObjectsFromArray:info.list];
        }
        [self.tableView reloadData];
        [self endRefresh:info.list.count];
    } failure:^(NSString * _Nonnull error) {
        [self endRefreshFailure];
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.model.indexpic.count ? SCREEN_WIDTH/640*268.0f : 0.00001;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    GKHomeBannerView *banner = [[GKHomeBannerView alloc] initWithReuseIdentifier:NSStringFromClass(GKHomeBannerView.class)];
    banner.listData = self.model.indexpic;
    return banner;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GKHomeItemCell *cell = [GKHomeItemCell cellForTableView:tableView indexPath:indexPath];
    cell.model = self.listData[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GKHomeNewModel *model = self.listData[indexPath.row];
    GKHomeItemDetailController *vc = [GKHomeItemDetailController vcWithItemId:model.html5];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
