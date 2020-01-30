#import "InvadeHollowCabbageController.h"
#import "AboutUsVController.h"
#import "UsVCViewCell.h"
@interface InvadeHollowCabbageController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *dataSource;

@end
@implementation InvadeHollowCabbageController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(setClick) title:@"nav_set"];
    
    _dataSource = @[@"隐私协议",@"意见反馈",@"关于我们"];
    
    [self tableView];
}



-(UITableView*)tableView{
    if (!_tableView) {
         if (@available(iOS 11.0, *)) {
              _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
          } else {
              self.automaticallyAdjustsScrollViewInsets = NO;
          }
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
         [_tableView registerNib:[UINib nibWithNibName:@"UsVCViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
         [self.view addSubview:_tableView];
    }
    return _tableView;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   UsVCViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.title.text  = [self.dataSource objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _dataSource.count;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)setClick{
    
    AboutUsVController*aboutUs = [AboutUsVController new];
    aboutUs.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:aboutUs animated:YES];
}

@end
