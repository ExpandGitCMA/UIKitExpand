#import "RetellFingernailController.h"
#import "SeriouslyConvenientStuffController.h"
#import "BlessPorter.h"
#import "ImpairBeingController.h"
#import "HollowMale.h"
#import "AnchorSongController.h"
@interface RetellFingernailController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *dataSource;

@end
@implementation RetellFingernailController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(setClick) title:@"nav_set"];
    
    _dataSource = @[@"隐私协议",@"意见反馈",@"分享好友",@"关于我们"];
    
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
         [_tableView registerNib:[UINib nibWithNibName:@"BlessPorter" bundle:nil] forCellReuseIdentifier:@"cell"];
         [self.view addSubview:_tableView];
    }
    return _tableView;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   BlessPorter *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
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
    
    switch (indexPath.row) {
        case 0:{
             ImpairBeingController *controller = [[ImpairBeingController  alloc] init];
              controller.hidesBottomBarWhenPushed = YES;
              [self.navigationController pushViewController:controller animated:YES];
           }
           
            break;
        case 1:{
            AnchorSongController*controller = [[AnchorSongController  alloc] init];
                      controller.hidesBottomBarWhenPushed = YES;
                      [self.navigationController pushViewController:controller animated:YES];
        }
            break;
            case 2:{
                [self showShareDetail];
            }
            break;
            case 3:
            [self setClick];
            break;
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)setClick{
    
    SeriouslyConvenientStuffController*aboutUs = [SeriouslyConvenientStuffController new];
    aboutUs.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:aboutUs animated:YES];
}

-(void)showShareDetail{
        // 1、设置分享的内容，并将内容添加到数组中
        NSString *shareText = @"分享的标题";
        UIImage *shareImage = [UIImage imageNamed:@"banner"];
        NSURL *shareUrl = [NSURL URLWithString:@"https://www.jianshu.com/u/4751e3a9bcfd"];
        NSArray *activityItemsArray = @[shareText,shareImage,shareUrl];
        
        // 自定义的CustomActivity，继承自UIActivity
        HollowMale *customActivity = [[HollowMale alloc]initWithTitle:shareText ActivityImage:[UIImage imageNamed:@"icon"] URL:shareUrl ActivityType:@"Custom"];
        NSArray *activityArray = @[customActivity];
        
        // 2、初始化控制器，添加分享内容至控制器
        UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItemsArray applicationActivities:activityArray];
        activityVC.modalInPopover = YES;
        // 3、设置回调
        if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
            // ios8.0 之后用此方法回调
            UIActivityViewControllerCompletionWithItemsHandler itemsBlock = ^(UIActivityType __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError){
                NSLog(@"activityType == %@",activityType);
                if (completed == YES) {
                    NSLog(@"completed");
                }else{
                    NSLog(@"cancel");
                }
            };
            activityVC.completionWithItemsHandler = itemsBlock;
        }else{
            // ios8.0 之前用此方法回调
            UIActivityViewControllerCompletionHandler handlerBlock = ^(UIActivityType __nullable activityType, BOOL completed){
                NSLog(@"activityType == %@",activityType);
                if (completed == YES) {
                    NSLog(@"completed");
                }else{
                    NSLog(@"cancel");
                }
            };
            activityVC.completionHandler = handlerBlock;
        }
        // 4、调用控制器
        [self presentViewController:activityVC animated:YES completion:nil];
        
    }
@end


