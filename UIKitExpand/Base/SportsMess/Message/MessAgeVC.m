#import "MessAgeVC.h"
#import "FeelLeatherManager.h"
#import "MessAgeModel.h"
#import "MessAgeCell.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
@interface MessAgeVC ()<UITableViewDelegate, UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataSource;
@end
@implementation MessAgeVC
- (void)viewDidLoad {
    [super viewDidLoad];
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
      [_tableView registerNib:[UINib nibWithNibName:@"MessAgeCell" bundle:nil] forCellReuseIdentifier:@"cell"];
       _tableView.emptyDataSetSource = self;
       _tableView.emptyDataSetDelegate = self;
         [self.view addSubview:_tableView];
    }
    return _tableView;
}
#pragma mark -- DZNEmptyDataSetSource
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    return [UIImage imageNamed:@"icon_data_empty"];
}
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *text = @"  数据空空如也... ";
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f],
       NSForegroundColorAttributeName: [UIColor lightGrayColor]};
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   MessAgeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    MessAgeModel *model = [self.dataSource objectAtIndex:indexPath.row];
    cell.title.text = model.title;
    cell.image.image = [UIImage imageNamed:model.image];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (void)getMassage{
    [[FeelLeatherManager sharedManager] requestWithLocalFileWithName:@"mesg" completed:^(BOOL ret, id obj) {
         NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"data"]];
        for (NSDictionary *dic in arr) {
           MessAgeModel *model = [MessAgeModel setModelWithDictionary:dic];
           [[self dataSource] addObject: model];
        }
    }];
}
-(NSMutableArray*)dataSource{
    if (!_dataSource) {
       _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
@end
