#import "NewstipsVC.h"
#import "BeatLikeNewspaper.h"
#import "AppHeaderFile.h"
#import "FeelLeatherManager.h"
#import "TableViewAnimationKit.h"
@interface NewstipsVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataSource;
@end

@implementation NewstipsVC
- (void)viewDidLoad {
    [super viewDidLoad];
     
    [self tableView];
    [self getMassage];
    
}

-(NSMutableArray*)dataSource{
    if (!_dataSource) {
       _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
-(UITableView*)tableView{
    if (!_tableView) {
         if (@available(iOS 11.0, *)) {
             _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
          } else {
              self.automaticallyAdjustsScrollViewInsets = NO;
          }
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,100, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
         _tableView.showsVerticalScrollIndicator = NO;
         [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Newcell"];
         [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)getMassage{
    [[FeelLeatherManager sharedManager]tryHeapUseful:URL_Gamerule params:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
           
            [self.dataSource removeAllObjects];
                 NSArray *arr = [obj objectForKey:@"game"];
                      for (NSDictionary *dic in arr) {
                         BeatLikeNewspaper *model = [BeatLikeNewspaper setModelWithDictionary:dic];
                         [ self.dataSource  addObject: model];
                      }
                      dispatch_async(dispatch_get_main_queue(), ^{
                        [self.tableView reloadData];
                        [self starAnimationWithTableView:self.tableView];
                      });
        }else{
            [self.tableView reloadData];
        }
     }];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Newcell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    BeatLikeNewspaper *model = self.dataSource[indexPath.row];
    cell.textLabel.text =  model.title;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)starAnimationWithTableView:(UITableView *)tableView {
    [TableViewAnimationKit showWithAnimationType:XSTableViewAnimationTypeToTop tableView:tableView];
}
@end
