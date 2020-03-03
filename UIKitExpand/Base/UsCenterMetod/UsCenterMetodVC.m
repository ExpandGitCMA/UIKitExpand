#import "UsCenterMetodVC.h"
#import "UserDefaultManager.h"
#import "UsCenterCell.h"
#import "SystemActivity.h"
#import "SVProgressHUD.h"
#import "UsCenterHead.h"
@interface UsCenterMetodVC ()

@property (nonatomic,strong) UsCenterHead*head;
@end



@implementation UsCenterMetodVC

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(setClick) title:@"nav_set"];
    NSArray*data = @[
           @{
               @"title":@"足球知识小课堂",
               @"content":@"",
           },
           @{
               @"title":@"给予意见反馈",
               @"content":@"",
           },
           @{
                @"title":@"快来分享一下",
                @"content":@"",
             },
           @{
                 @"title":@"系统设置",
                 @"content":@"",
             },
        
       ];
       
    
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadDataChange:) name:@"UsCenter" object:nil];

        self.dataSource = [NSMutableArray arrayWithArray:data];
        self.tableView.mj_header = nil;
        self.tableView.tableHeaderView = [self head];
        self.tableView.scrollEnabled =NO;
        [self.tableView registerNib:[UINib nibWithNibName:@"UsCenterCell" bundle:nil] forCellReuseIdentifier:@"cell"];
      
     
}
- (void)reloadDataChange:(NSNotification *)notification {
      User*user = [UserDefaultManager sharedDefaultManager].user;
        if ([UserDefaultManager isLogin]) {
               [_head.logoin setTitle:[NSString stringWithFormat:@"%@%@",user.name,user.mobile] forState:UIControlStateNormal];
        }else{
            [_head.logoin setTitle:@"登陆/注册" forState:UIControlStateNormal];
        }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self reloadDataChange:nil];
}

-(UsCenterHead*)head{
    if (!_head) {
        _head = [UsCenterHead loadNibNamedUsCenterHeadView];
        _head.frame = CGRectMake(0, 0, SCREEN_WIDTH,120);
        [_head.logoin addTarget:self action:@selector(logoinTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _head;
}


-(void)logoinTouchUpInside:(UIButton *)sender{
    if (![UserDefaultManager isLogin]) {
        [AppRouterUrl  switchTopresentLoginMetodVC:self];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   UsCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary*dic =  [self.dataSource SafetyObjectAtIndex:indexPath.row];
    cell.title.text  =  dic[@"title"];
    cell.content.text = dic[@"content"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    if ([UserDefaultManager isLogin]) {
         switch (indexPath.row) {
                case 0:
                    [AppRouterUrl  switchTopushRuleMetodVC:self];
            
                    break;
                case 1:

                     [AppRouterUrl  switchTopushFeedbackMetodVC:self];
                    
                
                    break;
                    case 2:
                     [self showShareDetail];
                
                    
                    break;
                    case 3:
                      [self setClick];
                    break;
                default:
                    break;
            }
      }else{
          [AppRouterUrl  switchTopresentLoginMetodVC:self];
      }
}


-(void)showShareDetail{
    NSString *shareText = @"分享的标题";
    UIImage *shareImage = [UIImage imageNamed:@"icon"];
    NSURL *shareUrl = [NSURL URLWithString:@"https://www.jianshu.com/u/4751e3a9bcfd"];
    NSArray *activityItemsArray = @[shareText,shareImage,shareUrl];
    SystemActivity *customActivity = [[SystemActivity alloc]initWithTitle:shareText ActivityImage:[UIImage imageNamed:@"icon"] URL:shareUrl ActivityType:@"Custom"];
    NSArray *activityArray = @[customActivity];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItemsArray applicationActivities:activityArray];
    activityVC.modalInPopover = YES;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
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
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setClick{
    
    if ([UserDefaultManager isLogin]) {
        [AppRouterUrl  switchTopushUsSystemVC:self];
    }else{
        [AppRouterUrl  switchTopresentLoginMetodVC:self];
    }
    
}



@end
