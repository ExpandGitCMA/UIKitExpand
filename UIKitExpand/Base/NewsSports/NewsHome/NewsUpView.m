#import "NewsUpView.h"
#import "NewsUpViewCell.h"
#import "FeelLeatherManager.h"
#import "NSString+IMAdditions.h"
#import "UIView+SDExtension.h"
#import "DFCWebViewCode.h"
#import "PermitRemoteChatController.h"
@interface NewsUpView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *arraySource;
@end
@implementation NewsUpView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
        [self getMassage];
    }
    return self;
}
-(NSMutableArray*)dataSource{
    if (!_arraySource) {
       _arraySource = [NSMutableArray array];
    }
    return _arraySource;
}
-(void)initView{
    _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor=[UIColor whiteColor];
    _tableView.tableFooterView = [UIView new];
    _tableView.rowHeight = 75;
    _tableView.scrollEnabled = NO;
    [_tableView registerNib:[UINib nibWithNibName:@"NewsUpViewCell" bundle:nil] forCellReuseIdentifier:@"NewsUpViewCell"];
    [self addSubview:_tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arraySource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     NewsUpViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsUpViewCell"];
    NSDictionary *dict = [self.arraySource SafetyObjectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.title.text = dict[@"title"];
    cell.timer.text =  dict[@"mtime"];
    return cell;
}
- (void)getMassage{
    [[FeelLeatherManager sharedManager]lookChemist:URL_Matchlist completed:^(BOOL ret, id obj) {
        if (ret) {
            NSArray *arr = [obj objectForKey:@"T1348647853363"];
            NSArray *smallArray = [arr subarrayWithRange:NSMakeRange(0, 2)];
            if (smallArray.count) {
                [[self dataSource] addObjectsFromArray:smallArray];
            }
           dispatch_async(dispatch_get_main_queue(), ^{
                 [self.tableView reloadData];
           });
        }else{
            [self.tableView reloadData];
        }
    }];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = [self.arraySource SafetyObjectAtIndex:indexPath.row];
    NSString*title = [dict objectForKey:@"title"];
    NSString*digest = [dict objectForKey:@"digest"];
    NSString*imgsrc = [dict objectForKey:@"imgsrc"];
    PermitRemoteChatController * homeDetailVC = [[PermitRemoteChatController alloc] init];
    homeDetailVC.hidesBottomBarWhenPushed = YES;
    homeDetailVC.conten = title;
    homeDetailVC.url = imgsrc;
    if ([digest isNull]) {
         homeDetailVC.conten = [NSString stringWithFormat:@"%@%@%@", title,@"\n",digest];
    }
  [[self viewController].navigationController pushViewController:homeDetailVC animated:YES];
}
@end
