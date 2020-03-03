#import "HomeMetodVC.h"
#import "VomitTime.h"
#import "RuleDetailsVC.h"
#import "GainDetectionAbnormal.h"
#import "HomeNewCell.h"
#import "CoordinateDinosaur.h"
#import "DFCHotContent.h"
#import "WKViewMetodVC.h"

#import "UnderlineDizzyTable.h"
#import "UserDefaultManager.h"
#import "FJPreImageView.h"

@interface HomeMetodVC ()<HotContentDelegate>
@property(nonatomic,strong)DFCHotContent *hotContent;
@property (nonatomic,assign)NSInteger totalPage;
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,assign) NSInteger contentPage;
@property (nonatomic,copy)NSArray *array;
@end
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@implementation HomeMetodVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUIView];
    _currentPage = 1;
    _contentPage = 0 ;
}
-(void)initUIView{
    [self whisk];
    __weak __typeof(self) weakSelf = self;
    CJWRefreshFooter *footer = [CJWRefreshFooter footerWithRefreshingBlock:^{
        [weakSelf getLoad];
    }];
    self.tableView.mj_footer = footer;
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeNewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self getHomeBanner];
}
-(void)whisk{
    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavLeftStyle barTarget:self action:@selector(whiskClick) title:@"category_camera_7_gray"];
     [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(msgClick) title:@"msg_home"];
}
-(void)getHomeBanner{
    [[HttpNetWorkManager sharedManager] requestGetMetod:URL_HomeBanner params:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
             _array = [obj objectForKey:@"banner"];
             [self.banner setArrayStringUrl:_array];
        }
    }];
}
-(void)cycleScrollView:(GeneralBanner *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{


     FJPreImageView * imageVc = [[FJPreImageView alloc]init];
      
      [imageVc setLongTapPressBlock:^(UIImage * _Nonnull image) {
          NSLog(@"长按图片回调");
      }];
      
      [imageVc showPreView:[UIApplication sharedApplication].keyWindow urls:_array index:0];
}

- (void)getLoad{
    if (_currentPage < _totalPage) {
               _currentPage++;
                NSString *page = [NSString stringWithFormat:@"%ld",(long)_currentPage];
               [self getBrandGoodDatasours:@{@"id":@"TY43,FOCUSTY43,TYTOPIC", @"page":page}];
         }else{
              [self.tableView.mj_footer endRefreshingWithNoMoreData];
         }
}
- (void)simplyTallWidth{
    if (_contentPage == 0) {
             _currentPage = 1;
            NSString *page = [NSString stringWithFormat:@"%ld", (long)_currentPage];
            [self getBrandGoodDatasours:@{@"id":@"TY43,FOCUSTY43,TYTOPIC", @"page":page}];
    }else{
         [self selectStatus:nil page:_contentPage];
    }
}
- (void)getBrandGoodDatasours:(NSDictionary *)dic{
     [[HttpNetWorkManager sharedManager] getNewsSportpath:URL_ComNews params:dic completed:^(BOOL ret, id obj) {
         if (ret) {
             if(_currentPage == 1){
                 _totalPage =  [obj[0][@"totalPage"] integerValue];
                 [self.dataSource removeAllObjects];
              }
             for (NSDictionary *dic in obj) {
                     NSArray *item = [dic objectForKey:@"item"];
                     for (NSDictionary *dic in item) {
                         NewsModel *model = [NewsModel setModelWithDictionary:dic];
                         [self.dataSource addObject: model];
                     }
               }
             dispatch_async(dispatch_get_main_queue(), ^{
                     self.tableView.tableHeaderView =  [self banner];
                     [self.tableView.mj_header endRefreshing];
                     [self.tableView.mj_footer endRefreshing];
                     [self.tableView reloadData];
                     [UnderlineDizzyTable hideActivityIndicator];
             });
         }else{
                [self.tableView.mj_header endRefreshing];
                [self.tableView.mj_footer endRefreshing];
                [self.tableView reloadData];
         }
     }];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeNewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NewsModel *model = [self.dataSource SafetyObjectAtIndex:indexPath.row];
    [cell setModel:model];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView{
   return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
     return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     return [self hotContent];
}
-(DFCHotContent*)hotContent{
    if (!_hotContent) {
        _hotContent = [[DFCHotContent alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 50) HotSearch:@[@"推荐",@"足球快讯",@"凤凰体育资讯"]];
        _hotContent.delegate = self;
    }
    return _hotContent;
}
-(void)selectStatus:(DFCHotContent*)selectStatus  page:(NSInteger)page{
    if ([selectStatus isNull]) {
           [UnderlineDizzyTable showActivityIndicator];
    }
    NSMutableArray*data = [[NSMutableArray alloc]init];
    _contentPage = page ;
    [self.dataSource removeAllObjects];
    if (page==0) {
          _currentPage = 1;
          NSString *page = [NSString stringWithFormat:@"%ld", (long)_currentPage];
          [self getBrandGoodDatasours:@{@"id":@"TY43,FOCUSTY43,TYTOPIC", @"page":page}];
    }else if (page==1){
        [[HttpNetWorkManager sharedManager] borrowNosebleed:@"date" completed:^(BOOL ret, id obj) {
             NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"data"]];
            for (NSDictionary *dic in arr) {
                   NewsModel *model = [NewsModel setModelWithDictionary:dic];
                   [data addObject: model];
            }
            self.dataSource = [self getRandomArrFrome:[data copy]];
            dispatch_async(dispatch_get_main_queue(), ^{
                    _currentPage = _totalPage;
                    [self.tableView.mj_header endRefreshing];
                    [self.tableView.mj_footer endRefreshing];
                    [self.tableView reloadData];
                    [self consistViaSky:self.tableView];
                    [UnderlineDizzyTable hideActivityIndicator];
            });
        }];
    }else{
         _currentPage = _totalPage;
         [self getBrandGoodDatasours:@{@"id":@"FOCUSTY43",@"page":@1}];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if ([UserDefaultManager isLogin]) {
          NewsModel *model = [self.dataSource SafetyObjectAtIndex:indexPath.row];
          RuleDetailsVC * homeDetailVC = [[RuleDetailsVC alloc] init];
          homeDetailVC.hidesBottomBarWhenPushed = YES;
          if ([model.content isNull]) {
              homeDetailVC.url = model.thumbnail;
              homeDetailVC.conten = model.content;
              [self.navigationController pushViewController:homeDetailVC animated:YES];
          }else{
              WKViewMetodVC* metodVC = [[WKViewMetodVC alloc]initGetLoadWitheresponseObjectUrl:model.link[@"url"] banner:@[]];
               metodVC.hidesBottomBarWhenPushed = YES;
              [self.navigationController pushViewController: metodVC animated:YES];
          }
    }else{
         [AppRouterUrl  switchTopresentLoginMetodVC:self];
    }
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
}

-(void)whiskClick{
    GainDetectionAbnormal *newCode = [[GainDetectionAbnormal alloc]init];
    newCode.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:newCode animated:YES];
}
#pragma mark - 点击消息按钮
- (void)msgClick {
    
    if ([UserDefaultManager isLogin]) {
        [AppRouterUrl  switchTopushMessAgeMetodVC:self];
    }else{
        [AppRouterUrl  switchTopresentLoginMetodVC:self];
    }
    
}
@end
