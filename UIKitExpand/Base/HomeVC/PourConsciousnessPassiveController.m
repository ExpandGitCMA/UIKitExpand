#import "PourConsciousnessPassiveController.h"
#import "FeelLeatherManager.h"
#import "ReuniteDifficultyWalletView.h"
#import "BackwardTallWreck.h"
#import "EndLinenPeak.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "MJRefresh.h"
#import "PermitRemoteChatController.h"
#import "TableViewAnimationKitHeaders.h"
#import "NewsCell.h"
#import "EndLImageCell.h"
#import "PreviousDiscount.h"
@interface PourConsciousnessPassiveController ()<ZeroSDCycleViewDelegate,UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong)ReuniteDifficultyWalletView *zeroSDCycleView;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *marr;
@property (nonatomic,strong) PreviousDiscount *search;//搜索框
@end
#define kTabBarH 64
#define Search_width 115
#define Search_height  40
@implementation PourConsciousnessPassiveController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUIView];
    [self.tableView.mj_header beginRefreshing];
}

-(void)initUIView{
    [self whisk];
    [self search];
    [self marr];
    [self tableView];
    [self getHomeBanner];
}

-(void)whisk{

    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(msgClick) title:@"msg_home"];
}


-(PreviousDiscount*)search{
    if (_search==nil) {
        _search = [[PreviousDiscount alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, Search_height)];
        [_search addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.titleView = _search;
        
        
    }
    return _search;
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
          [_tableView registerNib:[UINib nibWithNibName:@"EndLImageCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        [_tableView registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil] forCellReuseIdentifier:@"NewsCell"];
   
          [self.view addSubview:_tableView];
    }
    return _tableView;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

-(NSMutableArray*)marr{
    if (!_marr) {
       _marr = [NSMutableArray array];
    }
    return _marr;
}
-(void)getHomeBanner{
    [[FeelLeatherManager sharedManager]tryHeapUseful:URL_HomeBanner params:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
            NSArray *banner = [obj objectForKey:@"banner"];
           [_zeroSDCycleView setArrayStringUrl:banner];
        }
   
    }];
}
- (void)getMassage{
    [self.marr removeAllObjects];
    
    NSMutableArray*dataSource = [[NSMutableArray alloc]init];
    [[FeelLeatherManager sharedManager] requestWithLocalFileWithName:@"date" completed:^(BOOL ret, id obj) {
         NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"data"]];
        for (NSDictionary *dic in arr) {
           NewsModel *model = [NewsModel setModelWithDictionary:dic];
           [dataSource addObject: model];
        }
    }];
    
    
    [[FeelLeatherManager sharedManager]lookChemist:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
            NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"articles"]];
           for (NSDictionary *dic in arr) {
                      BackwardTallWreck *model = [BackwardTallWreck setModelWithDictionary:dic];
                      [dataSource addObject: model];
           }
            
          self.marr = [self getRandomArrFrome:[dataSource copy]];
           dispatch_async(dispatch_get_main_queue(), ^{
                      [self.tableView.mj_header endRefreshing];
                      [self.tableView.mj_footer endRefreshing];
                      [self.tableView reloadData];
                      [self starAnimationWithTableView:self.tableView];
           });
        }
    }];
}

-(NSMutableArray*)getRandomArrFrome:(NSArray*)arr{
    NSMutableArray *newArr = [NSMutableArray new];
    while (newArr.count != arr.count) {
        //生成随机数
        int x =arc4random() % arr.count;
        id obj = arr[x];
        if (![newArr containsObject:obj]) {
            [newArr addObject:obj];
        }
    }
    return newArr;
}

- (void)getLoad{
     dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView.mj_footer endRefreshing];
            [self.tableView reloadData];
    });
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell*tableViewCell;
    id obj = self.marr[indexPath.row];
    if ([obj isKindOfClass:[ BackwardTallWreck class]]) {
         
        NewsCell*cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
        BackwardTallWreck *model = self.marr [indexPath.row];
        cell.title.text = model.title;
        cell.timer .text = model.pubtime;
        tableViewCell = cell;
     }else if ([obj isKindOfClass:[ NewsModel class]]){
    
       EndLImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        NewsModel *model = self.marr [indexPath.row];

        cell.title.text = model.title;
        cell.timer .text = model.time;
        [cell.image sd_setImageWithURL:[NSURL URLWithString:model.image]
              placeholderImage:[UIImage imageNamed:@"icon_data_empty"]];
         
         tableViewCell = cell;
     }
    
    tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableViewCell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.marr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id obj = self.marr[indexPath.row];
       
    if ([obj isKindOfClass:[ BackwardTallWreck class]]) {
         BackwardTallWreck *model = self.marr [indexPath.row];
         CGFloat defutHeight = 45;
        return defutHeight+[self tableViewForRowAtIndexCellHeight:model.title];
    }else if ([obj isKindOfClass:[ NewsModel class]]){
        NewsModel *model = self.marr [indexPath.row];
        CGFloat defutHeight = 100;
        return defutHeight+[self tableViewForRowAtIndexCellHeight:model.title];
    }
    return 70;
}



-(CGFloat)tableViewForRowAtIndexCellHeight:(NSString *)title{
    CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 30, MAXFLOAT);
    return [title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]} context:nil].size.height;
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
    PermitRemoteChatController * homeDetailVC = [[PermitRemoteChatController alloc] init];
    homeDetailVC.hidesBottomBarWhenPushed = YES;
     id obj = self.marr[indexPath.row];
     if ([obj isKindOfClass:[ BackwardTallWreck class]]) {
       BackwardTallWreck *model = self.marr [indexPath.row];
       homeDetailVC.conten = [NSString stringWithFormat:@"%@%@%@%@%@",model.pubtime,@"\n",model.modtime_desc,model.title,model.tags  ];

       }else if ([obj isKindOfClass:[ NewsModel class]]){
            NewsModel *model = self.marr [indexPath.row];
            homeDetailVC.conten = [NSString stringWithFormat:@"%@%@%@",model.time,@"\n",model.title];
           homeDetailVC.url = model.image;
       }
    
     [self.navigationController pushViewController:homeDetailVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)starAnimationWithTableView:(UITableView *)tableView {
    
    [TableViewAnimationKit showWithAnimationType:     XSTableViewAnimationTypeSpringList tableView:tableView];
}

#pragma mark 点击搜索框点击事件
- (void)searchClick{
    

}

-(void)whiskClick{

}

#pragma mark - 点击消息按钮
- (void)msgClick {
    
}

@end
