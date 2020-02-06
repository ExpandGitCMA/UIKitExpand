#import "PollinateFeatureEntertainingController.h"
#import "VomitTime.h"
#import "GovernIntoPreserveController.h"
#import "ExtinctAppearance.h"
#import "GainDetectionAbnormal.h"
#import "RoarTowardInvestment.h"
#import "CareUniversityEcofriendly.h"
@interface PollinateFeatureEntertainingController ()
@end
@implementation PollinateFeatureEntertainingController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUIView];
}
-(void)initUIView{
    [self whisk];
    [self.tableView registerNib:[UINib nibWithNibName:@"CareUniversityEcofriendly" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"RoarTowardInvestment" bundle:nil] forCellReuseIdentifier:@"RoarTowardInvestment"];
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
             DEBUG_NSLog(@"obj=%@",obj);
        }
    }];
}
- (void)simplyTallWidth{
    NSMutableArray*data = [[NSMutableArray alloc]init];
    [[DisrespectfulLabourManager sharedManager] borrowNosebleed:@"date" completed:^(BOOL ret, id obj) {
         NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"data"]];
        for (NSDictionary *dic in arr) {
           NewsModel *model = [NewsModel setModelWithDictionary:dic];
           [data addObject: model];
        }
    }];
    [[DisrespectfulLabourManager sharedManager]sailThroughAlternativeMineral:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
            [self.dataSource removeAllObjects];
            NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"articles"]];
           for (NSDictionary *dic in arr) {
                      VomitTime *model = [VomitTime setModelWithDictionary:dic];
                      [data addObject: model];
           }
           self.dataSource = [self getRandomArrFrome:[data copy]];
           dispatch_async(dispatch_get_main_queue(), ^{
                      self.tableView.tableHeaderView =  [self DeceitfultView];
                      [self.tableView.mj_header endRefreshing];
                      [self.tableView.mj_footer endRefreshing];
                      [self.tableView reloadData];
                      [self consistViaSky:self.tableView];
           });
        }else{
                [self.tableView.mj_header endRefreshing];
                [self.tableView.mj_footer endRefreshing];
                [self.tableView reloadData];
        }
    }];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell*tableViewCell;
    id obj = self.dataSource[indexPath.row];
    if ([obj isKindOfClass:[ VomitTime class]]) {
        RoarTowardInvestment*cell = [tableView dequeueReusableCellWithIdentifier:@"RoarTowardInvestment" forIndexPath:indexPath];
        VomitTime *model = self.dataSource[indexPath.row];
        cell.title.text = model.title;
        cell.timer .text = model.pubtime;
        tableViewCell = cell;
     }else if ([obj isKindOfClass:[ NewsModel class]]){
       CareUniversityEcofriendly *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        NewsModel *model = self.dataSource [indexPath.row];
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
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id obj = self.dataSource[indexPath.row];
    if ([obj isKindOfClass:[ VomitTime class]]) {
         VomitTime *model = self.dataSource [indexPath.row];
         CGFloat defutHeight = 60;
        return defutHeight+[self tableViewForRowAtIndexCellHeight:model.title];
    }else if ([obj isKindOfClass:[ NewsModel class]]){
        NewsModel *model = self.dataSource [indexPath.row];
        CGFloat defutHeight = 110;
        return defutHeight+[self tableViewForRowAtIndexCellHeight:model.title];
    }
    return 70;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GovernIntoPreserveController * homeDetailVC = [[GovernIntoPreserveController alloc] init];
    homeDetailVC.hidesBottomBarWhenPushed = YES;
     id obj = self.dataSource[indexPath.row];
     if ([obj isKindOfClass:[ VomitTime class]]) {
       VomitTime *model = self.dataSource [indexPath.row];
       homeDetailVC.conten = [NSString stringWithFormat:@"%@%@%@%@",model.pubtime,@"\n",model.tags,model.title];
       }else if ([obj isKindOfClass:[ NewsModel class]]){
            NewsModel *model = self.dataSource [indexPath.row];
            homeDetailVC.conten = [NSString stringWithFormat:@"%@%@%@",model.time,@"\n",model.title];
           homeDetailVC.url = model.image;
       }
     [self.navigationController pushViewController:homeDetailVC animated:YES];
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


