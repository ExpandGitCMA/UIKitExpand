#import "BriefThornController.h"
#import "MJRefresh.h"
#import "FeelLeatherManager.h"
#import "BeatLikeNewspaper.h"
#import "EndLinenPeak.h"
#import "PermitRemoteChatController.h"
#import "ReuniteDifficultyWalletView.h"
#import "TableViewAnimationKitHeaders.h"
@interface BriefThornController ()<ZeroSDCycleViewDelegate,UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataSource;
@property(nonatomic,strong)ReuniteDifficultyWalletView *zeroSDCycleView;
@end
@implementation BriefThornController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataSource];
    [self tableView];
    [self.tableView.mj_header beginRefreshing];
    self.title = @"球赛规则";
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
        _tableView.tableHeaderView =  [self zeroSDCycleView];
         _tableView.tableFooterView = [UIView new];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getMassage)];
          [_tableView registerNib:[UINib nibWithNibName:@"EndLinenPeak" bundle:nil] forCellReuseIdentifier:@"Newcell"];
          [self.view addSubview:_tableView];
    }
    return _tableView;
}
-(NSMutableArray*)dataSource{
    if (!_dataSource) {
       _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)getMassage{
    [[FeelLeatherManager sharedManager]tryHeapUseful:URL_Gamerule params:@{} completed:^(BOOL ret, id obj) {
        [self.dataSource removeAllObjects];
        NSArray *arr = [obj objectForKey:@"game"];
             for (NSDictionary *dic in arr) {
                BeatLikeNewspaper *model = [BeatLikeNewspaper setModelWithDictionary:dic];
                [self.dataSource  addObject: model];
             }
            [_zeroSDCycleView setArrayStringUrl:@[@"https://n.sinaimg.cn/sports/transform/283/w650h433/20200102/1697-imkzenq6385157.jpg"]];
             dispatch_async(dispatch_get_main_queue(), ^{
                        [self.tableView.mj_header endRefreshing];
                        [self.tableView.mj_footer endRefreshing];
                        [self.tableView reloadData];
                        [self starAnimationWithTableView:self.tableView];
             });
     }];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EndLinenPeak *cell = [tableView dequeueReusableCellWithIdentifier:@"Newcell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    BeatLikeNewspaper *model = self.dataSource[indexPath.row];
    cell.title.text = model.title;
    cell.title.numberOfLines = 0;
    cell.time.text = [NSString stringWithFormat:@"%@%@%@%@",@"(",model.title,@")",model.rule];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     BeatLikeNewspaper *model = self.dataSource[indexPath.row];
    PermitRemoteChatController * homeDetailVC = [[PermitRemoteChatController alloc] init];
           homeDetailVC.hidesBottomBarWhenPushed = YES;
           homeDetailVC.title = model.title;
           homeDetailVC.conten = model.rule;
           [self.navigationController pushViewController:homeDetailVC animated:YES];
}
-(ReuniteDifficultyWalletView*)zeroSDCycleView{
    if (!_zeroSDCycleView) {
        _zeroSDCycleView = [ReuniteDifficultyWalletView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 190) delegate:self];
        [_zeroSDCycleView setShowPageControl:YES];
        [_zeroSDCycleView  setPageControlStyle:ZeroSDCycleViewPageContolStyleAnimated];
        [_zeroSDCycleView setPageControlAliment:   ZeroSDCycleViewPageContolAlimentCenter];
         [_zeroSDCycleView setAutoScrollTimeInterval:15.0f];
    }
    return _zeroSDCycleView;
}
-(void)cycleScrollView:(ReuniteDifficultyWalletView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)starAnimationWithTableView:(UITableView *)tableView {
    
    [TableViewAnimationKit showWithAnimationType:   XSTableViewAnimationTypeToTop tableView:tableView];
}
@end
