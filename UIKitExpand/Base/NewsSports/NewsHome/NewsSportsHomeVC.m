#import "NewsSportsHomeVC.h"
#import "BackwardTallWreck.h"
#import "PermitRemoteChatController.h"
#import "MessAgeVC.h"
#import "DFCNewCode.h"
#import "NewsCell.h"
#import "EndLImageCell.h"
#import "DFCWebViewCode.h"
#import "PlanLogic.h"
#import "NewsPlayBallCell.h"
#import "NewsBallCell.h"
#import "NewsSportCell.h"
#import "NewsSportModel.h"
#import "Leagstus.h"
#import "LeagstusCell.h"
#import "NewsUpView.h"
@interface NewsSportsHomeVC ()
@property(nonatomic,strong)NewsUpView*upView;
@end
@implementation NewsSportsHomeVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUIView];
}
-(void)initUIView{
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsPlayBallCell" bundle:nil] forCellReuseIdentifier:@"PlayBallCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsBallCell" bundle:nil] forCellReuseIdentifier:@"BallCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsSportCell" bundle:nil] forCellReuseIdentifier:@"SportCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LeagstusCell" bundle:nil] forCellReuseIdentifier:@"LeagstusCell"];
    [self getHomeBanner];
}
-(void)getHomeBanner{
    [[FeelLeatherManager sharedManager]tryHeapUseful:URL_HomeBanner params:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
             BOOL boolValue = [[obj objectForKey:@"vanue"] boolValue];
             DEBUG_NSLog(@"boolValue=%d",boolValue);
            if ( boolValue ) {
                 DFCWebViewCode *webView = [[DFCWebViewCode alloc]initWithUrl:[obj objectForKey:@"content"]];
                 webView.hidesBottomBarWhenPushed = YES;
                 [webView setCodeAliment:WebViewCodeCenter];
                 [webView setBoolValue:boolValue];
                 [self.navigationController pushViewController:webView animated:YES];
            }
            NSArray *banner = [obj objectForKey:@"banner"];
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
        NSArray *content = [NSArray arrayWithArray:[obj objectForKey:@"content"]];
               for (NSDictionary *dic in content) {
                  NewsSportModel *model = [NewsSportModel setModelWithDictionary:dic];
            [data addObject: model];
        }
       NSArray *leagstus = [obj objectForKey:@"Leagstus"];
        for (NSDictionary *dic in leagstus) {
               Leagstus *model = [Leagstus setModelWithDictionary:dic];
               [data addObject: model];
        }
    }];
    [[FeelLeatherManager sharedManager]lookChemist:URL_HomeNews completed:^(BOOL ret, id obj) {
        if (ret) {
            [self.dataSource removeAllObjects];
              NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"articles"]];
           for (NSDictionary *dic in arr) {
                 BackwardTallWreck *model = [BackwardTallWreck setModelWithDictionary:dic];
                 [data addObject: model];
           }
          self.dataSource = [self getRandomArrFrome:[data copy]];
           dispatch_async(dispatch_get_main_queue(), ^{
                       [[self zeroSDCycleView]  setPageControlStyle:ZeroSDCycleViewPageContolStyleClassic];
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
         NewsBallCell*cell = [tableView dequeueReusableCellWithIdentifier:@"BallCell" forIndexPath:indexPath];
        BackwardTallWreck *model = self.dataSource[indexPath.row];
        cell.title.text = model.title;
        cell.timer .text = model.pubtime;
        tableViewCell = cell;
     }else if ([obj isKindOfClass:[ NewsModel class]]){
       NewsPlayBallCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayBallCell" forIndexPath:indexPath];
        NewsModel *model = self.dataSource [indexPath.row];
        cell.title.text = model.title;
        cell.timer .text = model.time;
         [cell.image sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"news_empty"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
         }];
         tableViewCell = cell;
     }else if ([obj isKindOfClass:[NewsSportModel class]]){
           NewsSportCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SportCell" forIndexPath:indexPath];
            NewsSportModel *model = self.dataSource [indexPath.row];
            cell.title.text = model.title;
            cell.content.text = model.time;
            [cell.image setImage:[UIImage imageNamed:model.image]];
            tableViewCell = cell;
     }else if ([obj isKindOfClass:[Leagstus class]]){
             LeagstusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeagstusCell" forIndexPath:indexPath];
            Leagstus *model = self.dataSource [indexPath.row];
            cell.content.text = model.title;
            [cell.imageUrl sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"news_empty"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                 }];
            tableViewCell = cell;
     }
    tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableViewCell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return self.dataSource.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView{
   return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [self upView];
}
-(NewsUpView*)upView{
    if (!_upView) {
        _upView = [[NewsUpView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    }
    return _upView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 id obj = self.dataSource[indexPath.row];
    if ([obj isKindOfClass:[ BackwardTallWreck class]]) {
         BackwardTallWreck *model = self.dataSource [indexPath.row];
         CGFloat defutHeight = 38;
        return defutHeight+[self tableViewForRowAtIndexCellHeight:model.title];
    }else if ([obj isKindOfClass:[ NewsModel class]]){
        NewsModel *model = self.dataSource [indexPath.row];
        CGFloat defutHeight = 195;
        return defutHeight+[self tableViewForRowAtIndexCellHeight:model.title];
    }else if ([obj isKindOfClass:[NewsSportModel class]]){
        CGFloat defutHeight = 125;
        return defutHeight;
    }else if ([obj isKindOfClass:[Leagstus class]]){
        CGFloat defutHeight = 205;
        Leagstus *model = self.dataSource [indexPath.row];
        return defutHeight+[self tableViewForRowAtIndexCellHeight:model.content];
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
         if([model.image isNull]){
              homeDetailVC.url =  model.image;
           }else{
             homeDetailVC.image = @"news_empty";
            }
        }else if ([obj isKindOfClass:[NewsSportModel class]]){
            NewsSportModel *model = self.dataSource [indexPath.row];
            homeDetailVC.conten = [NSString stringWithFormat:@"%@%@%@",model.title,@"\n",model.content];
            homeDetailVC.image = model.image;
          }else if ([obj isKindOfClass:[Leagstus class]]){
                Leagstus *model = self.dataSource [indexPath.row];
                homeDetailVC.url = model.image;
                homeDetailVC.conten = [NSString stringWithFormat:@"%@%@%@",model.content,@"\n \n",model.name];
            }
     [self.navigationController pushViewController:homeDetailVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
