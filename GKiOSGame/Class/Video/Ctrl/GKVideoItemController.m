//
//  GKVideoItemController.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/10/9.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKVideoItemController.h"
#import "GKVideoPlayController.h"
#import "GKVideoItemCell.h"
@interface GKVideoItemController ()
@property (strong, nonatomic) NSMutableArray *listData;
@end

@implementation GKVideoItemController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupEmpty:self.tableView];
    [self setupRefresh:self.tableView option:ATRefreshDefault];
}
- (void)setItem:(GKVideoItem *)item{
    _item = item;
    [self.tableView setContentOffset:CGPointMake(0,0) animated:NO];
    [self refreshData:1];
}
- (void)refreshData:(NSInteger)page{
    [GKVideoNetManager videoId:self.item.itemId page:page success:^(id  _Nonnull object) {
        if(page == 1){
            self.listData = @[].mutableCopy;
            [self.listData removeAllObjects];
        }
        NSArray *datas = [NSArray modelArrayWithClass:GKItemModel.class json:object[@"items"]];
        if (datas.count) {
            [self.listData addObjectsFromArray:datas];
        }
        [self.tableView reloadData];
        [self endRefresh:datas.count > 0];
    } failure:^(NSString * _Nonnull error) {
        [self endRefreshFailure];
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GKVideoItemCell *cell = [GKVideoItemCell cellForTableView:tableView indexPath:indexPath];
    cell.model = self.listData[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GKItemModel *model =self.listData[indexPath.row];
    if (!model.video) {
        [MBProgressHUD showMessage:@"播放失败资源缺失" toView:self.view];
        [self.listData removeObject:model];
        [tableView reloadData];
        return;
    }
    UIViewController *vc = [GKVideoPlayController vcWithPlayModel:model.video];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
