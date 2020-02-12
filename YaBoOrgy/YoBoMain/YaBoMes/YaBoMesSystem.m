//
//  YaBoMesSystem.m
//  UIKitExpand
//
//  Created by admin on 8/2/2020.
//  Copyright © 2020 ZeroSmell. All rights reserved.
//

#import "YaBoMesSystem.h"
#import "BlessPorter.h"
#import "AnchorSongController.h"
#import "SVProgressHUD.h"
#import "YoBoDefault.h"

@interface YaBoMesSystem ()
@property (nonatomic,strong) UIButton*logoOut;
@end


@implementation YaBoMesSystem

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray*data = @[
         
         @{
             @"title":@"意见反馈",
             @"content":@"",
         },
         @{
             @"title":@"清除缓存",
             @"content":@"",
           },
         @{
               @"title":@"当前版本",
               @"content":@"V1.0.5",
          },
     ];
     

      self.dataSource = [NSMutableArray arrayWithArray:data];
      self.tableView.mj_header = nil;
      self.tableView.scrollEnabled =NO;

      [self.tableView registerNib:[UINib nibWithNibName:@"BlessPorter" bundle:nil] forCellReuseIdentifier:@"cell"];
    
      _logoOut = [UIButton buttonWithType:UIButtonTypeCustom];
     _logoOut.backgroundColor = kUIColorFromRGB(AppScore);
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
      [[YoBoDefault defaultUser]removeAccount];
      [self.navigationController popViewControllerAnimated:YES];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BlessPorter *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
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
            
        case 0:{
            AnchorSongController *controller = [[ AnchorSongController  alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
           }

            break;
            case 1:
           
             [SVProgressHUD show];
             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
               [SVProgressHUD showSuccessWithStatus:@"缓存清理成功"];
                
             });
            
            break;
        default:
            break;
    }
   
}





@end
