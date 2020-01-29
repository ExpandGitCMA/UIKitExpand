#import "FrustrateFamilyInefficientController.h"
#import "WeaveAboutCheekboneManager.h"
#import "ZeroSDCycleView.h"
#import "NewModel.h"
#import "NewTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "MJRefresh.h"

@interface FrustrateFamilyInefficientController ()<ZeroSDCycleViewDelegate,UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong)ZeroSDCycleView *zeroSDCycleView;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *marr;
@end

#define kTabBarH 64

@implementation FrustrateFamilyInefficientController


- (void)viewDidLoad {
    [super viewDidLoad];
//    [self zeroSDCycleView];

    [self marr];
    [self tableView];
    [self getHomeBanner];
  
    
}

-(UITableView*)tableView{
    if (!_tableView) {
         if (@available(iOS 11.0, *)) {
              _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
          } else {
              self.automaticallyAdjustsScrollViewInsets = NO;
          }
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT - kTabBarH)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView =  [self zeroSDCycleView];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getHomeBanner)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getLoad)];
          [_tableView registerNib:[UINib nibWithNibName:@"NewTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
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

    [[WeaveAboutCheekboneManager sharedManager]lendGate:URL_HomeBanner params:@{} completed:^(BOOL ret, id obj) {
        NSArray *banner = [obj objectForKey:@"banner"];
         [_zeroSDCycleView setArrayStringUrl:banner];
    }];

    [[WeaveAboutCheekboneManager sharedManager]requestHomeNews:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
            [self.marr removeAllObjects];
            NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"articles"]];
           for (NSDictionary *dic in arr) {
                      NewModel *model = [NewModel setModelWithDictionary:dic];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;  
    NewModel *model = self.marr [indexPath.row];
    NSString *str = [NSString stringWithFormat:@"http://in.3b2o.com/img/show/sid/%@/w//h//t/1/show.jpg",model.thumb_id];
    [cell.pic sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"icon_data_empty"]];
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

-(ZeroSDCycleView*)zeroSDCycleView{
    if (!_zeroSDCycleView) {
        _zeroSDCycleView = [ZeroSDCycleView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 190) delegate:self];
        [_zeroSDCycleView setShowPageControl:YES];
        [_zeroSDCycleView  setPageControlStyle:ZeroSDCycleViewPageContolStyleAnimated];
        [_zeroSDCycleView setPageControlAliment:   ZeroSDCycleViewPageContolAlimentCenter];
         [_zeroSDCycleView setAutoScrollTimeInterval:3.5f];
    }
    return _zeroSDCycleView;
}

-(void)cycleScrollView:(ZeroSDCycleView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
