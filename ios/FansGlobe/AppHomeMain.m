//
//  ViewController.m
//  Marbles
//
//  Created by hqtech on 2018/4/20.
//  Copyright © 2018年 tulip. All rights reserved.
// 

#import "AppHomeMain.h"
#import "RuleReferralVC.h"
#import "ReuniteViceStrapController.h"
#import "SwitchBidDirtyController.h"
#import "StarTextView.h"

@interface AppHomeMain ()
@property (nonatomic, strong)StarTextView *starView;
@property (nonatomic, strong)StarTextView *starViewTwo;
@end

// 屏幕宽度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
// 屏幕高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

// 屏幕宽度比例 375*667
#define kW_Scale (kScreenWidth/320.0)
// 屏幕高度比例
#define kH_Scale (kScreenHeight/568.0)

@implementation AppHomeMain

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self starView];
    [self starViewTwo];
  
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
 
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self->_starView  deceiveMuddyLoss];
        [self->_starViewTwo  deceiveMuddyLoss];
    });
    
}

-(StarTextView*)starView{
    if (!_starView) {
        //闪亮星星
        _starView = [[StarTextView alloc]initWithFrame:CGRectMake(85*kW_Scale, 175*kH_Scale, 20*kW_Scale,20*kW_Scale) type:ZeroStarTypeStar];
        [self.view addSubview:_starView];
    }
    return _starView;
}

-(StarTextView*)starViewTwo{
    if (!_starViewTwo) {
        //闪亮星星
        _starViewTwo = [[StarTextView alloc] initWithFrame:CGRectMake(185*kW_Scale, 175*kH_Scale, 20*kW_Scale,20*kW_Scale) type:ZeroStarTypeStar];
        [self.view addSubview:_starViewTwo];
    }
    return _starViewTwo;
}

#pragma mark 闯关模式
- (IBAction)levelMode:(id)sender {
    SwitchBidDirtyController *levelVC = [[SwitchBidDirtyController alloc] initWithNibName:@"SwitchBidDirtyController" bundle:nil];
    [self.navigationController pushViewController:levelVC animated:YES];
}

#pragma mark 随机模式
- (IBAction)randomMode:(id)sender {
    ReuniteViceStrapController *detailsVC = [[ReuniteViceStrapController alloc] initWithNibName:@"ReuniteViceStrapController" bundle:nil];
    detailsVC.type = MODE_TYPE_RANDOM;
    [self.navigationController pushViewController: detailsVC animated:YES];
}

#pragma mark 规则介绍
- (IBAction)rulesIntroduction:(id)sender {

    RuleReferralVC *rulesVC = [[RuleReferralVC alloc]init];
    [self.navigationController pushViewController:rulesVC animated:YES];
    
}


@end






