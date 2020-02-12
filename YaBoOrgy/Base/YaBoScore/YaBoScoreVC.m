#import "YaBoScoreVC.h"
#import "BeatLikeNewspaper.h"
#import "AppHeaderFile.h"
#import "FeelLeatherManager.h"
#import "TableViewAnimationKit.h"
#import "AppColorHeader.h"
#import "YaBoScoreView.h"
@interface YaBoScoreVC ()<UITableViewDelegate, UITableViewDataSource,UITextViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataSource;
@property(assign,nonatomic)NSInteger isCurrentSelect;
@property(nonatomic,strong)YaBoScoreView *textView;
@end
@implementation YaBoScoreVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self textView];
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
                        BeatLikeNewspaper *model = self.dataSource[0];
                        _textView.text.text = model.rule;
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
    if (_isCurrentSelect == indexPath.row) {
         cell.textLabel.textColor = kUIColorFromRGB(AppScore);
        cell.textLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 17];
    }else{
         cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        
    }
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _isCurrentSelect = indexPath.row;
    BeatLikeNewspaper *model = self.dataSource[indexPath.row];
    _textView.text.text = model.rule;
    [tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)starAnimationWithTableView:(UITableView *)tableView {
    [TableViewAnimationKit showWithAnimationType:XSTableViewAnimationTypeToTop tableView:tableView];
}
-(YaBoScoreView*)textView{
    if (!_textView) {
        _textView = [YaBoScoreView loadNibNamedYaBoScoreView];
          _textView.frame = CGRectMake(100, 0, SCREEN_WIDTH - 100, SCREEN_HEIGHT);
          _textView.userInteractionEnabled = YES;
        _textView.text.delegate = self;
        [self.view addSubview:_textView];
    }
    return _textView;
}
  - (BOOL)textViewShouldBeginEditing:(UITextView *)textView{ return NO; }
@end
