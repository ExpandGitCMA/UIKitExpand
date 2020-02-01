#import "PourConsciousnessPassiveController.h"
#import "BackwardTallWreck.h"
#import "PermitRemoteChatController.h"
#import "MessAgeVC.h"
#import "DFCNewCode.h"
#import "NewsCell.h"
#import "EndLImageCell.h"
#import "DFCWebViewCode.h"
@interface PourConsciousnessPassiveController ()
@end
@implementation PourConsciousnessPassiveController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUIView];
}
-(void)initUIView{
    [self whisk];
    [self.tableView registerNib:[UINib nibWithNibName:@"EndLImageCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil] forCellReuseIdentifier:@"NewsCell"];
    [self getHomeBanner];
}
-(void)whisk{
    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavLeftStyle barTarget:self action:@selector(whiskClick) title:@"category_camera_7_gray"];
     [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(msgClick) title:@"msg_home"];
}
-(void)getHomeBanner{
    [[FeelLeatherManager sharedManager]tryHeapUseful:URL_HomeBanner params:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
             NSArray *banner = [obj objectForKey:@"banner"];
             BOOL boolValue = [[obj objectForKey:@"vanue"] boolValue];
             DEBUG_NSLog(@"boolValue=%d",boolValue);
            
            if ( boolValue ) {
                DFCWebViewCode *webView = [[DFCWebViewCode alloc]initWithUrl:[obj objectForKey:@"content"]];
                  webView.hidesBottomBarWhenPushed = YES;
                 [webView setCodeAliment:WebViewCodeCenter];
                 [self.navigationController pushViewController:webView animated:YES];
            }
            
             [self.zeroSDCycleView setArrayStringUrl:banner];
        }
    }];
}
- (void)getMassage{
    NSMutableArray*data = [[NSMutableArray alloc]init];
    [[FeelLeatherManager sharedManager] requestWithLocalFileWithName:@"date" completed:^(BOOL ret, id obj) {
         NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"data"]];
        for (NSDictionary *dic in arr) {
           NewsModel *model = [NewsModel setModelWithDictionary:dic];
           [data addObject: model];
        }
    }];
    [[FeelLeatherManager sharedManager]lookChemist:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
            [self.dataSource removeAllObjects];
            NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"articles"]];
           for (NSDictionary *dic in arr) {
                      BackwardTallWreck *model = [BackwardTallWreck setModelWithDictionary:dic];
                      [data addObject: model];
           }
           self.dataSource = [self getRandomArrFrome:[data copy]];
           dispatch_async(dispatch_get_main_queue(), ^{
                      self.tableView.tableHeaderView =  [self zeroSDCycleView];
                      [self.tableView.mj_header endRefreshing];
                      [self.tableView.mj_footer endRefreshing];
                      [self.tableView reloadData];
                      [self starAnimationWithTableView:self.tableView];
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
    if ([obj isKindOfClass:[ BackwardTallWreck class]]) {
        NewsCell*cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
        BackwardTallWreck *model = self.dataSource[indexPath.row];
        cell.title.text = model.title;
        cell.timer .text = model.tags;
        cell.content.text = model.pubtime;
        tableViewCell = cell;
     }else if ([obj isKindOfClass:[ NewsModel class]]){
       EndLImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
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
    if ([obj isKindOfClass:[ BackwardTallWreck class]]) {
         BackwardTallWreck *model = self.dataSource [indexPath.row];
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
    PermitRemoteChatController * homeDetailVC = [[PermitRemoteChatController alloc] init];
    homeDetailVC.hidesBottomBarWhenPushed = YES;
     id obj = self.dataSource[indexPath.row];
     if ([obj isKindOfClass:[ BackwardTallWreck class]]) {
       BackwardTallWreck *model = self.dataSource [indexPath.row];
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
     MessAgeVC * homeDetailVC = [[MessAgeVC alloc] init];
     homeDetailVC.hidesBottomBarWhenPushed = YES;
     homeDetailVC.title = @"热点搜索";
     [self.navigationController pushViewController:homeDetailVC animated:YES];
}
-(void)whiskClick{
    DFCNewCode *newCode = [[DFCNewCode alloc]init];
    newCode.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:newCode animated:YES];
}
#pragma mark - 点击消息按钮
- (void)msgClick {
    MessAgeVC * homeDetailVC = [[MessAgeVC alloc] init];
    homeDetailVC.hidesBottomBarWhenPushed = YES;
    homeDetailVC.title = @"消息中心";
    [self.navigationController pushViewController:homeDetailVC animated:YES];
}
@end
