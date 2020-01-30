#import "GKMenuViewController.h"
#import "GKVideoController.h"
static NSString *new = @"资讯";
static NSString *video = @"视频";
static NSString *picture = @"图片";
static NSString *down = @"下载";
@interface GKMenuViewController ()
@property (strong, nonatomic) NSArray *listData;
@end
@implementation GKMenuViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * btn;
    [btn setTitle:@"normal" forState:UIControlStateNormal|UIControlStateHighlighted];
    [btn setTitle:@"select" forState:UIControlStateSelected|UIControlStateHighlighted];
    self.view.backgroundColor = Appxf8f8f8;
    self.title = @"菜单";
    self.listData = @[new,video,picture,down];
    [self.tableView reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell cellForTableView:tableView indexPath:indexPath];
    cell.textLabel.text = self.listData[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.viewDeckController closeSide:YES];
    UIViewController *root = [UIViewController rootTopPresentedController];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSString *title = self.listData[indexPath.row];
        if ([title isEqualToString:down]) {
            GKVideoController *vc = [[GKVideoController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [[UIViewController rootTopPresentedController].navigationController pushViewController:vc animated:YES];
        }else if ([title isEqualToString:video]){
            root.tabBarController.selectedIndex = 1;
        }else if([title isEqualToString:picture]){
            root.tabBarController.selectedIndex = 2;
        }else if ([title isEqualToString:new]){
            root.tabBarController.selectedIndex = 0;
        }
    });
}
@end
