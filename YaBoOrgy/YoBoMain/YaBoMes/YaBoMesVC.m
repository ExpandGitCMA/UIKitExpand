#import "YaBoMesVC.h"
#import "SeriouslyConvenientStuffController.h"
#import "BlessPorter.h"
#import "ImpairBeingController.h"
#import "HollowMale.h"
#import "AnchorSongController.h"
#import "YaBoScoreVC.h"
#import "YoBoLogin.h"
@interface YaBoMesVC ()
@end
@implementation YaBoMesVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(setClick) title:@"nav_set"];
     self.dataSource = [NSMutableArray arrayWithObjects:@"隐私协议",@"意见反馈",@"分享好友",@"足球小知识",@"关于我们",nil];
     [self.tableView registerNib:[UINib nibWithNibName:@"BlessPorter" bundle:nil] forCellReuseIdentifier:@"cell"];
     self.tableView.mj_header = nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   BlessPorter *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.title.text  = [self.dataSource SafetyObjectAtIndex:indexPath.row];
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
    
    
    if ([YoBoDefault isLogin]) {

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
                case 3:{
                     YaBoScoreVC *score = [YaBoScoreVC new];
                      score.hidesBottomBarWhenPushed = YES;
                      [self.navigationController pushViewController:score animated:YES];
                }
                break;
                case 4:{
                    SeriouslyConvenientStuffController*aboutUs = [SeriouslyConvenientStuffController new];
                    aboutUs.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:aboutUs animated:YES];
                }
            
                break;
            default:
                break;
        }
    }else{
        UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:[YoBoLogin new]];
        [self presentViewController:navc animated:YES completion:nil];
        
    }
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)setClick{
   
    
    if ([YoBoDefault isLogin]) {
        SeriouslyConvenientStuffController*aboutUs = [SeriouslyConvenientStuffController new];
           aboutUs.hidesBottomBarWhenPushed = YES;
           [self.navigationController pushViewController:aboutUs animated:YES];
    }else{
        UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:[YoBoLogin new]];
        [self presentViewController:navc animated:YES completion:nil];
    }
}
-(void)showShareDetail{
        NSString *shareText = @"分享的标题";
        UIImage *shareImage = [UIImage imageNamed:@"banner"];
        NSURL *shareUrl = [NSURL URLWithString:@"https://github.com/makshow/CityShop.git"];
        NSArray *activityItemsArray = @[shareText,shareImage,shareUrl];
        HollowMale *customActivity = [[HollowMale alloc]initWithTitle:shareText ActivityImage:[UIImage imageNamed:@"icon"] URL:shareUrl ActivityType:@"Custom"];
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
@end
