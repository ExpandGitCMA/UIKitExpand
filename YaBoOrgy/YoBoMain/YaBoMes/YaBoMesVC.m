#import "YaBoMesVC.h"
#import "SeriouslyConvenientStuffController.h"
#import "BlessPorter.h"
#import "ImpairBeingController.h"
#import "HollowMale.h"
#import "AnchorSongController.h"
#import "YaBoScoreVC.h"
#import "YoBoLogin.h"
#import "YaBoMesSystem.h"

@interface YaBoMesVC ()
@end
@implementation YaBoMesVC

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(setClick) title:@"nav_set"];
     [self.tableView registerNib:[UINib nibWithNibName:@"BlessPorter" bundle:nil] forCellReuseIdentifier:@"cell"];
     self.tableView.mj_header = nil;
     self.tableView.scrollEnabled =NO;
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData:) name:@"reloadDataUS" object:nil];
}


- (void)reloadData:(NSNotification *)notification {
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   BlessPorter *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.title.text  = [[YoBoDefault getUsSource] SafetyObjectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if ([YoBoDefault isLogin]&&indexPath.row == 0 ) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [YoBoDefault getUsSource].count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if ([YoBoDefault isLogin]) {

        switch (indexPath.row) {
            case 0:{
                break;
            }
            case 1:{
                 ImpairBeingController *controller = [[ImpairBeingController  alloc] init];
                  controller.hidesBottomBarWhenPushed = YES;
                  [self.navigationController pushViewController:controller animated:YES];
               }
                break;
            case 2:{
                AnchorSongController*controller = [[AnchorSongController  alloc] init];
                          controller.hidesBottomBarWhenPushed = YES;
                          [self.navigationController pushViewController:controller animated:YES];
            }
                break;
                case 3:{
                    [self showShareDetail];
                }
                break;
                case 4:{
                     YaBoScoreVC *score = [YaBoScoreVC new];
                      score.hidesBottomBarWhenPushed = YES;
                      [self.navigationController pushViewController:score animated:YES];
                }
                break;
                case 5:{
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
           YaBoMesSystem*systemVC = [ YaBoMesSystem new];
           systemVC.hidesBottomBarWhenPushed = YES;
           [self.navigationController pushViewController:systemVC animated:YES];
    }else{
        UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:[YoBoLogin new]];
        [self presentViewController:navc animated:YES completion:^{}];
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
