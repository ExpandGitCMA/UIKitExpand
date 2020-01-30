#import "GKWallBaseController.h"
#import "GKWallCollectionViewLayout.h"
#import "GKWallCollectionViewCell.h"
#import "GKWallItemModel.h"
@interface GKWallBaseController ()<GKWallLayoutDelegate>
@property (strong, nonatomic) NSMutableArray *listData;
@end
@implementation GKWallBaseController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.listData = @[].mutableCopy;
    [self setupEmpty:self.collectionView];
    [self setupRefresh:self.collectionView option:ATRefreshDefault];
}
- (void)refreshData:(NSInteger)page{
    GKHomeItem *item = [GKHomeItem vcWithTitle:@"" mod:@"" dtid:@"83623,31528,31537,31538,57067,91821" type:@"pic" classs:@"" classmore:@""];
    [GKHomeNetManager home:item page:page - 1 success:^(id  _Nonnull object) {
        if (page == RefreshPageStart) {
            [self.listData removeAllObjects];
        }
        NSArray *datas = [NSArray modelArrayWithClass:GKWallModel.class json:object[@"list"]];
        if (datas.count) {
            [self.listData addObjectsFromArray:datas];
        }
        [self.collectionView reloadData];
        [self endRefresh:datas.count];
    } failure:^(NSString * _Nonnull error) {
        [self endRefreshFailure];
    }];
}
#pragma mark GKWallLayoutDelegate
- (CGFloat)wallLayout:(GKWallCollectionViewLayout *)layout heightForIndexPath:(NSIndexPath *)indePath itemWidth:(CGFloat)itemWidth{
    CGFloat height = indePath.row == 0 ? 30 : 0;
    height = (SCREEN_WIDTH - 30 )/2*1.35 + height;
    return SCALEW(height + 45);
}
- (NSInteger)numberOfSection{
    return 1;
}
- (NSInteger)numberOfColumnInLayout:(GKWallCollectionViewLayout *)layout{
    return 2;
}
- (CGFloat)columnMarginLayout:(GKWallCollectionViewLayout *)layout{
    return 10;
}
- (CGFloat)rowMarginLayout:(GKWallCollectionViewLayout *)layout{
    return 10;
}
- (UIEdgeInsets)edgeInsetdLayout:(GKWallCollectionViewLayout *)layout{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.listData.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GKWallCollectionViewCell *cell = [GKWallCollectionViewCell cellForCollectionView:collectionView indexPath:indexPath];
    cell.model = self.listData[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GKWallModel *model = self.listData[indexPath.row];
    [GKHomeNetManager wallDetail:model.aid success:^(id  _Nonnull object) {
        NSArray *datas = [NSArray modelArrayWithClass:GKWallItemModel.class json:object[@"content"]];
        ATBrowserController *vc = [ATBrowserController vcWithDatas:datas selectIndex:0];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    } failure:^(NSString * _Nonnull error) {
    }];
}
#pragma mark get
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        GKWallCollectionViewLayout * layout = [[GKWallCollectionViewLayout alloc]init];
        layout.delegate = self;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.scrollEnabled = YES;
    }
    return _collectionView;
}
@end
