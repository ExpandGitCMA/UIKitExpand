#import "BaseMetodVC.h"
@interface BaseMetodVC ()
@end

@implementation BaseMetodVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self dataSource];
}
-(GeneralBanner*)banner{
    if (!_banner) {
        _banner = [GeneralBanner cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 190) delegate:self];
        [_banner setShowPageControl:YES];
        [_banner  setPageControlStyle:bannerPageContolStyleClassic];
        [_banner setPageControlAliment:bannerPageContolAlimentCenter];
         [_banner setAutoScrollTimeInterval:3.5f];
    }
    return _banner;
}
-(void)cycleScrollView:(GeneralBanner *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
}
-(NSMutableArray*)dataSource{
    if (!_dataSource) {
       _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
-(UITableView*)tableView{
    if (!_tableView) {
         if (@available(iOS 11.0, *)) {
             _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
          } else {
              self.automaticallyAdjustsScrollViewInsets = NO;
          }
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
           __weak __typeof(self) weakSelf = self;
        CJWRefreshHeader *header = [CJWRefreshHeader headerWithRefreshingBlock:^{
            [weakSelf simplyTallWidth];
        }];
        header.automaticallyChangeAlpha = YES;
        _tableView.mj_header = header;
        [_tableView.mj_header beginRefreshing];
         [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (void)getLoad{
}
- (void)simplyTallWidth{
     [_tableView.mj_footer resetNoMoreData];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
}
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    return [UIImage imageNamed:@"icon_data_empty"];
}
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *text = @"  数据空空如也... ";
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f],
       NSForegroundColorAttributeName: [UIColor lightGrayColor]};
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:nil];
    return cell;
}
-(NSMutableArray*)getRandomArrFrome:(NSArray*)arr{
    NSMutableArray *newArr = [NSMutableArray new];
    while (newArr.count != arr.count) {
        int x =arc4random() % arr.count;
        id obj = arr[x];
        if (![newArr containsObject:obj]) {
            [newArr addObject:obj];
        }
    }
    return newArr;
}
-(CGFloat)tableViewForRowAtIndexCellHeight:(NSString *)title{
    CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 30, MAXFLOAT);
    return [title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]} context:nil].size.height;
}
- (void)consistViaSky:(UITableView *)tableView {
    [AsFondAssembly showWithAnimationType:XSTableViewAnimationTypeSpringList tableView:tableView];
}
@end
