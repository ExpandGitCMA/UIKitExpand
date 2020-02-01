#import "BriefThornController.h"
#import "MJRefresh.h"
#import "FeelLeatherManager.h"
#import "BeatLikeNewspaper.h"
#import "EndLinenPeak.h"
#import "PermitRemoteChatController.h"
#import "ReuniteDifficultyWalletView.h"
#import "TableViewAnimationKitHeaders.h"

@interface BriefThornController ()
@end

@implementation BriefThornController
- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"球赛规则";
     [self.tableView registerNib:[UINib nibWithNibName:@"EndLinenPeak" bundle:nil] forCellReuseIdentifier:@"Newcell"];
     [self.zeroSDCycleView setArrayStringUrl:@[@"https://n.sinaimg.cn/sports/transform/283/w650h433/20200102/1697-imkzenq6385157.jpg"]];
}




- (void)getMassage{
    [[FeelLeatherManager sharedManager]tryHeapUseful:URL_Gamerule params:@{} completed:^(BOOL ret, id obj) {
        
        if (ret) {
            self.tableView.tableHeaderView =  [self zeroSDCycleView];
            [self.dataSource removeAllObjects];
                 NSMutableArray*date = [NSMutableArray array];
                 NSArray *arr = [obj objectForKey:@"game"];
                      for (NSDictionary *dic in arr) {
                         BeatLikeNewspaper *model = [BeatLikeNewspaper setModelWithDictionary:dic];
                         [date  addObject: model];
                      }
                 self.dataSource = [self getRandomArrFrome:[date copy]];
               
                      dispatch_async(dispatch_get_main_queue(), ^{
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
    EndLinenPeak *cell = [tableView dequeueReusableCellWithIdentifier:@"Newcell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    BeatLikeNewspaper *model = self.dataSource[indexPath.row];
    cell.title.text = model.title;
    cell.title.numberOfLines = 0;
    cell.time.text = [NSString stringWithFormat:@"%@%@%@%@",@"(",model.title,@")",model.rule];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataSource.count;
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)starAnimationWithTableView:(UITableView *)tableView {
    
    [TableViewAnimationKit showWithAnimationType:XSTableViewAnimationTypeToTop tableView:tableView];
}
@end
