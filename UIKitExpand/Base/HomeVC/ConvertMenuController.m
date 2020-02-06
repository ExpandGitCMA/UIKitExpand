#import "ConvertMenuController.h"
#import "SufferHardwareGracious.h"
#import "RescueDuskController.h"
#import "OpenMud.h"
#import "RespectSwallow.h"
#import "BureaucraticGreed.h"
#import "TwistCornerRealistic.h"
@interface ConvertMenuController ()
@end
@implementation ConvertMenuController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUIView];
}
-(void)initUIView{
    [self whisk];
    [self.tableView registerNib:[UINib nibWithNibName:@"TwistCornerRealistic" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BureaucraticGreed" bundle:nil] forCellReuseIdentifier:@"BureaucraticGreed"];
    [self getHomeBanner];
}
-(void)whisk{
    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavLeftStyle barTarget:self action:@selector(whiskClick) title:@"category_camera_7_gray"];
     [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(msgClick) title:@"msg_home"];
}
-(void)getHomeBanner{
    [[CopyManmadeCatastropheManager sharedManager]tenderLandmine:URL_HomeBanner params:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
             NSArray *banner = [obj objectForKey:@"banner"];
             BOOL boolValue = [[obj objectForKey:@"vanue"] boolValue];
             DEBUG_NSLog(@"boolValue=%d",boolValue);
             [self.zeroSDCycleView setArrayStringUrl:banner];
        }
    }];
}
- (void)worshipForFundimentalWhisky{
    NSMutableArray*data = [[NSMutableArray alloc]init];
    [[CopyManmadeCatastropheManager sharedManager] downMinusCeremony:@"date" completed:^(BOOL ret, id obj) {
         NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"data"]];
        for (NSDictionary *dic in arr) {
           NewsModel *model = [NewsModel setModelWithDictionary:dic];
           [data addObject: model];
        }
    }];
    [[CopyManmadeCatastropheManager sharedManager]relaxViaNiece:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
            [self.dataSource removeAllObjects];
            NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"articles"]];
           for (NSDictionary *dic in arr) {
                      SufferHardwareGracious *model = [SufferHardwareGracious setModelWithDictionary:dic];
                      [data addObject: model];
           }
           self.dataSource = [self getRandomArrFrome:[data copy]];
           dispatch_async(dispatch_get_main_queue(), ^{
                      self.tableView.tableHeaderView =  [self zeroSDCycleView];
                      [self.tableView.mj_header endRefreshing];
                      [self.tableView.mj_footer endRefreshing];
                      [self.tableView reloadData];
                      [self unloadFluentMidst:self.tableView];
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
    if ([obj isKindOfClass:[ SufferHardwareGracious class]]) {
        BureaucraticGreed*cell = [tableView dequeueReusableCellWithIdentifier:@"BureaucraticGreed" forIndexPath:indexPath];
        SufferHardwareGracious *model = self.dataSource[indexPath.row];
        cell.title.text = model.title;
        cell.timer .text = model.tags;
        cell.content.text = model.pubtime;
        tableViewCell = cell;
     }else if ([obj isKindOfClass:[ NewsModel class]]){
       TwistCornerRealistic *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
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
    if ([obj isKindOfClass:[ SufferHardwareGracious class]]) {
         SufferHardwareGracious *model = self.dataSource [indexPath.row];
         CGFloat defutHeight = 65;
        return defutHeight+[self tableViewForRowAtIndexCellHeight:model.title];
    }else if ([obj isKindOfClass:[ NewsModel class]]){
        NewsModel *model = self.dataSource [indexPath.row];
        CGFloat defutHeight = 100;
        return defutHeight+[self tableViewForRowAtIndexCellHeight:model.title];
    }
    return 70;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RescueDuskController * homeDetailVC = [[RescueDuskController alloc] init];
    homeDetailVC.hidesBottomBarWhenPushed = YES;
     id obj = self.dataSource[indexPath.row];
     if ([obj isKindOfClass:[ SufferHardwareGracious class]]) {
       SufferHardwareGracious *model = self.dataSource [indexPath.row];
       homeDetailVC.conten = [NSString stringWithFormat:@"%@%@%@%@",model.pubtime,@"\n",model.modtime_desc,model.title];
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
     OpenMud * homeDetailVC = [[OpenMud alloc] init];
     homeDetailVC.hidesBottomBarWhenPushed = YES;
     homeDetailVC.title = @"热点搜索";
     [self.navigationController pushViewController:homeDetailVC animated:YES];
}
-(void)whiskClick{
    RespectSwallow *newCode = [[RespectSwallow alloc]init];
    newCode.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:newCode animated:YES];
}
#pragma mark - 点击消息按钮
- (void)msgClick {
    OpenMud * homeDetailVC = [[OpenMud alloc] init];
    homeDetailVC.hidesBottomBarWhenPushed = YES;
    homeDetailVC.title = @"消息中心";
    [self.navigationController pushViewController:homeDetailVC animated:YES];
}
@end
