#import "PollinateFeatureEntertainingController.h"
#import "VomitTime.h"
#import "GovernIntoPreserveController.h"
#import "ExtinctAppearance.h"
#import "GainDetectionAbnormal.h"
#import "RoarTowardInvestment.h"
#import "CareUniversityEcofriendly.h"
#import "CoordinateDinosaur.h"
#import "DFCHotContent.h"





@interface PollinateFeatureEntertainingController ()<HotContentDelegate>
@property(nonatomic,strong)DFCHotContent *hotContent;
@property (nonatomic,assign)NSInteger totalPage;
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,assign) NSInteger contentPage;
@end
@implementation PollinateFeatureEntertainingController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUIView];
    _currentPage = 1;
    _contentPage = 0 ;
    
}
-(void)initUIView{
    [self whisk];
    [self.tableView registerNib:[UINib nibWithNibName:@"CareUniversityEcofriendly" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self getHomeBanner];
}
-(void)whisk{
    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavLeftStyle barTarget:self action:@selector(whiskClick) title:@"category_camera_7_gray"];
     [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(msgClick) title:@"msg_home"];
}
-(void)getHomeBanner{
    [[DisrespectfulLabourManager sharedManager] goUponGutter:URL_HomeBanner params:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
             NSArray *banner = [obj objectForKey:@"banner"];
             BOOL boolValue = [[obj objectForKey:@"vanue"] boolValue];
             [self.DeceitfultView setArrayStringUrl:banner];
             if ( boolValue ) {
                  CoordinateDinosaur *inosaur = [[CoordinateDinosaur alloc]initWithUrl:[obj objectForKey:@"content"]];
                   inosaur.hidesBottomBarWhenPushed = YES;
                  [inosaur setCodeAliment:WebViewCodeCenter];
                  [self.navigationController pushViewController:inosaur animated:YES];
             }
        }
    }];
}


- (void)getLoad{
    

    
    if (_currentPage < _totalPage) {
               _currentPage++;
                NSString *page = [NSString stringWithFormat:@"%ld",(long)_currentPage];
               [self getBrandGoodDatasours:page];
                    
         }else{
                    
              [self.tableView.mj_footer endRefreshingWithNoMoreData];
         }
    

       
}
- (void)simplyTallWidth{

    if (_contentPage == 0) {
             _currentPage = 1;
            NSString *page = [NSString stringWithFormat:@"%ld", (long)_currentPage];
            [self getBrandGoodDatasours:page];
    }else{
        
         [self selectStatus:nil page:_contentPage];
    }
   

}

- (void)getBrandGoodDatasours:(NSString *)page{
     NSDictionary *dic = @{@"id":@"TY43,FOCUSTY43,TYTOPIC", @"page":page};
     [[DisrespectfulLabourManager sharedManager] getSportsNewspath:URL_ComNews params:dic completed:^(BOOL ret, id obj) {
         
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
                     self.tableView.tableHeaderView =  [self DeceitfultView];
                     [self.tableView.mj_header endRefreshing];
                     [self.tableView.mj_footer endRefreshing];
                     [self.tableView reloadData];
             });
         }else{
                [self.tableView.mj_header endRefreshing];
                [self.tableView.mj_footer endRefreshing];
                [self.tableView reloadData];
         }
     }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CareUniversityEcofriendly *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
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
        _hotContent = [[DFCHotContent alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 50) HotSearch:@[@"头条",@"足球快讯",@"亚冠"]];
        _hotContent.delegate = self;
    }
    return _hotContent;
}


-(void)selectStatus:(DFCHotContent*)selectStatus  page:(NSInteger)page{
    
    NSMutableArray*data = [[NSMutableArray alloc]init];
    _contentPage = page ;
    [self.dataSource removeAllObjects];
    if (page==0) {
        _currentPage = 1;
          NSString *page = [NSString stringWithFormat:@"%ld", (long)_currentPage];
          [self getBrandGoodDatasours:page];
    }else if (page==1){

        [[DisrespectfulLabourManager sharedManager] borrowNosebleed:@"date" completed:^(BOOL ret, id obj) {
            
             NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"data"]];
            for (NSDictionary *dic in arr) {
                   NewsModel *model = [NewsModel setModelWithDictionary:dic];
                   [data addObject: model];
            }
            self.dataSource = [self getRandomArrFrome:[data copy]];
            dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView.mj_header endRefreshing];
                    [self.tableView.mj_footer endRefreshing];
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                    [self.tableView reloadData];
                    [self consistViaSky:self.tableView];
            });
        }];
    }else{
     
       NSDictionary *dic = @{@"id":@"FOCUSTY43",@"page":@1};
       [[DisrespectfulLabourManager sharedManager] getSportsNewspath:URL_ComNews params:dic completed:^(BOOL ret, id obj) {
           
           if (ret) {
               for (NSDictionary *dic in obj) {
                       NSArray *item = [dic objectForKey:@"item"];
                       for (NSDictionary *dic in item) {
                           
                           NewsModel *model = [NewsModel setModelWithDictionary:dic];
                           [data addObject: model];
                       }
                 }
               self.dataSource = [self getRandomArrFrome:[data copy]];
               dispatch_async(dispatch_get_main_queue(), ^{
                       [self.tableView.mj_header endRefreshing];
                       [self.tableView.mj_footer endRefreshing];
                       [self.tableView.mj_footer endRefreshingWithNoMoreData];
                       [self.tableView reloadData];
               });
           }else{
                  [self.tableView.mj_header endRefreshing];
                  [self.tableView.mj_footer endRefreshing];
                  [self.tableView reloadData];
           }
       }];
            

    }
 
    
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

       NewsModel *model = self.dataSource [indexPath.row];
       NSString *url = model.link[@"weburl"];
       if ([url isNull]){
              CoordinateDinosaur *inosaur = [[CoordinateDinosaur alloc]initWithUrl:url];
              inosaur.hidesBottomBarWhenPushed = YES;
              [self.navigationController pushViewController:inosaur animated:YES];
       }else if ([model.content isNull]){
            GovernIntoPreserveController * homeDetailVC = [[GovernIntoPreserveController alloc] init];
            homeDetailVC.hidesBottomBarWhenPushed = YES;
            homeDetailVC.conten = model.content;
            [self.navigationController pushViewController:homeDetailVC animated:YES];
       }else{
           
            
       }
    
    
  
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
}
#pragma mark 点击搜索框点击事件
- (void)searchClick{
     ExtinctAppearance * homeDetailVC = [[ExtinctAppearance alloc] init];
     homeDetailVC.hidesBottomBarWhenPushed = YES;
     homeDetailVC.title = @"热点搜索";
     [self.navigationController pushViewController:homeDetailVC animated:YES];
}
-(void)whiskClick{
    GainDetectionAbnormal *newCode = [[GainDetectionAbnormal alloc]init];
    newCode.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:newCode animated:YES];
}
#pragma mark - 点击消息按钮
- (void)msgClick {
    ExtinctAppearance * homeDetailVC = [[ExtinctAppearance alloc] init];
    homeDetailVC.hidesBottomBarWhenPushed = YES;
    homeDetailVC.title = @"消息中心";
    [self.navigationController pushViewController:homeDetailVC animated:YES];
}
@end
