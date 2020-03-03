//
//  UsSystemVC.m
//  UIKitExpand
//
//  Created by admin on 8/2/2020.
//  Copyright © 2020 ZeroSmell. All rights reserved.
//

#import "UsSystemVC.h"
#import "UsCenterCell.h"
#import "SystemActivity.h"
#import "SVProgressHUD.h"
#import "UserDefaultManager.h"
@interface UsSystemVC ()
@property (nonatomic,strong) UIButton*logoOut;
@end

@implementation UsSystemVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray*data = @[
         @{
             @"title":@"联系我们",
             @"content":@"0755-88263658",
         },
         @{
             @"title":@"意见反馈",
             @"content":@"",
         },
         @{
              @"title":@"清除缓存",
              @"content":@"",
           },
         @{
               @"title":@"关于我们",
               @"content":@"",
           },
         @{
               @"title":@"隐私协议",
               @"content":@"",
              },
         @{
               @"title":@"当前版本",
               @"content":@"V1.0.0",
              },
     ];
     
  

      self.dataSource = [NSMutableArray arrayWithArray:data];
      self.tableView.mj_header = nil;
      self.tableView.scrollEnabled =NO;

      [self.tableView registerNib:[UINib nibWithNibName:@"UsCenterCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
      _logoOut = [UIButton buttonWithType:UIButtonTypeCustom];
        _logoOut.backgroundColor = kUIColorFromRGB(AppMianColor);
        _logoOut.frame = CGRectMake((SCREEN_WIDTH-300)/2, SCREEN_HEIGHT-150, 300, 45);
        [_logoOut setTitle:@"退出登陆" forState:UIControlStateNormal];
        [_logoOut setTintColor:[UIColor whiteColor]];
       [_logoOut addTarget:self action:@selector(logoOutAction:) forControlEvents:UIControlEventTouchUpInside];
        _logoOut.layer.cornerRadius = 5;
       _logoOut.layer.masksToBounds=YES;
       [self.view addSubview:_logoOut];
}


-(void)logoOutAction:(UIButton *)sender  {
    
      [AVUser logOut];
      [[UserDefaultManager sharedDefaultManager]removeAccount];
      [self.navigationController popViewControllerAnimated:YES];
      [[NSNotificationCenter defaultCenter] postNotificationName:@"UsCenter" object:nil];
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

    switch (indexPath.row) {
        case 0:

             [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://0755-88263658"]];
            break;
        case 1:

             [AppRouterUrl  switchTopushFeedbackMetodVC:self];
            
        
            break;
            case 2:
           
             [SVProgressHUD show];
             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
               [SVProgressHUD showSuccessWithStatus:@"缓存清理成功"];
                
             });
            
            break;
            case 3:
            [AppRouterUrl  switchTopushAboutUsMetodVC:self];
            break;
            case 4:
            [AppRouterUrl  switchTopushUserPrivacyVC:self];
            break;
        default:
            break;
    }
   
}





@end
