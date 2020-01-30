#import "PourConsciousnessPassiveController.h"
#import "FeelLeatherManager.h"
#import "ReuniteDifficultyWalletView.h"
#import "BackwardTallWreck.h"
#import "EndLinenPeak.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "MJRefresh.h"
#import "PermitRemoteChatController.h"
@interface PourConsciousnessPassiveController ()<ZeroSDCycleViewDelegate,UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong)ReuniteDifficultyWalletView *zeroSDCycleView;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *marr;
@end
#define kTabBarH 64
@implementation PourConsciousnessPassiveController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self marr];
    [self tableView];
    [self getHomeBanner];
    [self.tableView.mj_header beginRefreshing];
}

-(UITableView*)tableView{
    if (!_tableView) {
         if (@available(iOS 11.0, *)) {
              _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
          } else {
              self.automaticallyAdjustsScrollViewInsets = NO;
          }
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT - kTabBarH)];
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView =  [self zeroSDCycleView];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getMassage)];
          [_tableView registerNib:[UINib nibWithNibName:@"EndLinenPeak" bundle:nil] forCellReuseIdentifier:@"cell"];
          [self.view addSubview:_tableView];
    }
    return _tableView;
}
-(NSMutableArray*)marr{
    if (!_marr) {
       _marr = [NSMutableArray array];
    }
    return _marr;
}
-(void)getHomeBanner{
    [[FeelLeatherManager sharedManager]tryHeapUseful:URL_HomeBanner params:@{} completed:^(BOOL ret, id obj) {
        NSArray *banner = [obj objectForKey:@"banner"];
         [_zeroSDCycleView setArrayStringUrl:banner];
    }];
}
- (void)getMassage{
    [[FeelLeatherManager sharedManager]lookChemist:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
            [self.marr removeAllObjects];
            NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"articles"]];
           for (NSDictionary *dic in arr) {
                      BackwardTallWreck *model = [BackwardTallWreck setModelWithDictionary:dic];
                      [self.marr addObject: model];
           }
           dispatch_async(dispatch_get_main_queue(), ^{
                      [self.tableView.mj_header endRefreshing];
                      [self.tableView.mj_footer endRefreshing];
                      [self.tableView reloadData];
           });
        }
    }];
}
- (void)getLoad{
     dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView.mj_footer endRefreshing];
            [self.tableView reloadData];
    });
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EndLinenPeak *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;  
    BackwardTallWreck *model = self.marr [indexPath.row];
    cell.pic.layer.masksToBounds = YES;
    cell.pic.layer.cornerRadius = 5;
    cell.title.text = model.title;
    cell.title.numberOfLines = 0;
    cell.time.text = model.pubtime;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.marr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 115;
}
-(ReuniteDifficultyWalletView*)zeroSDCycleView{
    if (!_zeroSDCycleView) {
        _zeroSDCycleView = [ReuniteDifficultyWalletView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 190) delegate:self];
        [_zeroSDCycleView setShowPageControl:YES];
        [_zeroSDCycleView  setPageControlStyle:ZeroSDCycleViewPageContolStyleAnimated];
        [_zeroSDCycleView setPageControlAliment:   ZeroSDCycleViewPageContolAlimentCenter];
         [_zeroSDCycleView setAutoScrollTimeInterval:3.5f];
    }
    return _zeroSDCycleView;
}
-(void)cycleScrollView:(ReuniteDifficultyWalletView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
      BackwardTallWreck *model = self.marr [indexPath.row];
    PermitRemoteChatController * homeDetailVC = [[PermitRemoteChatController alloc] init];
           homeDetailVC.hidesBottomBarWhenPushed = YES;
           homeDetailVC.conten = [NSString stringWithFormat:@"%@%@%@",model.pubtime,@"\n",model.title ];
           [self.navigationController pushViewController:homeDetailVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
