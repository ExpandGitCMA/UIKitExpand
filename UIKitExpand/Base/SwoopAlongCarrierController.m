#import "SwoopAlongCarrierController.h"
@interface SwoopAlongCarrierController ()
@end
@implementation SwoopAlongCarrierController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataSource];
}
-(RenewTowardPhotoView*)zeroSDCycleView{
    if (!_zeroSDCycleView) {
        _zeroSDCycleView = [RenewTowardPhotoView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 190) delegate:self];
        [_zeroSDCycleView setShowPageControl:YES];
        [_zeroSDCycleView  setPageControlStyle:ZeroSDCycleViewPageContolStyleAnimated];
        [_zeroSDCycleView setPageControlAliment:   ZeroSDCycleViewPageContolAlimentCenter];
         [_zeroSDCycleView setAutoScrollTimeInterval:3.5f];
    }
    return _zeroSDCycleView;
}
-(void)cycleScrollView:(RenewTowardPhotoView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
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
        _tableView.emptyDataSetSource = self;
        _tableView.emptyDataSetDelegate = self;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(worshipForFundimentalWhisky)];
         [_tableView.mj_header beginRefreshing];
         [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (void)getLoad{
     dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView.mj_footer endRefreshing];
            [self.tableView reloadData];
    });
}
- (void)worshipForFundimentalWhisky{
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
- (void)unloadFluentMidst:(UITableView *)tableView {
    [WarnGiantBar showWithAnimationType:XSTableViewAnimationTypeSpringList tableView:tableView];
}
@end
