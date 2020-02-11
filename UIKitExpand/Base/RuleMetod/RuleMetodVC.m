#import "RuleMetodVC.h"
#import "MJRefresh.h"
#import "HttpNetWorkManager.h"
#import "RuleModel.h"
#import "RebuildIllJoy.h"
#import "RuleDetailsVC.h"
#import "GeneralBanner.h"
#import "TableViewAnimationKitHeaders.h"
@interface RuleMetodVC ()
@end
@implementation RuleMetodVC
- (void)viewDidLoad {
    [super viewDidLoad];
     [self.tableView registerNib:[UINib nibWithNibName:@"RebuildIllJoy" bundle:nil] forCellReuseIdentifier:@"Newcell"];
      [self.banner  setPageControlStyle:  bannerPageContolStyleNone];
     [self.banner setArrayStringUrl:@[@"timg_image"]];
}

- (void)simplyTallWidth{
    [[HttpNetWorkManager sharedManager]requestGetMetod:URL_Gamerule params:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
            self.tableView.tableHeaderView =  [self banner];
            [self.dataSource removeAllObjects];
                 NSMutableArray*date = [NSMutableArray array];
                 NSArray *arr = [obj objectForKey:@"game"];
                      for (NSDictionary *dic in arr) {
                          RuleModel *model = [ RuleModel setModelWithDictionary:dic];
                         [date  addObject: model];
                      }
                 self.dataSource = [self getRandomArrFrome:[date copy]];
                      dispatch_async(dispatch_get_main_queue(), ^{
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
    RebuildIllJoy *cell = [tableView dequeueReusableCellWithIdentifier:@"Newcell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
     RuleModel *model = self.dataSource[indexPath.row];
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
      RuleModel *model = self.dataSource[indexPath.row];
    RuleDetailsVC * homeDetailVC = [[RuleDetailsVC alloc] init];
           homeDetailVC.hidesBottomBarWhenPushed = YES;
           homeDetailVC.title = model.title;
           homeDetailVC.conten = model.rule;
           [self.navigationController pushViewController:homeDetailVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)consistViaSky:(UITableView *)tableView {
    [AsFondAssembly showWithAnimationType:XSTableViewAnimationTypeToTop tableView:tableView];
}
@end
