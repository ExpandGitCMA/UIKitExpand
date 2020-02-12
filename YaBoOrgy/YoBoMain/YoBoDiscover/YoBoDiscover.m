//
//  YoBoDiscover.m
//  YaBoOrgy
//
//  Created by admin on 12/2/2020.
//  Copyright © 2020 SportsMac. All rights reserved.
//

#import "YoBoDiscover.h"
#import "YoBoDefault.h"
#import "MunityNoteCell.h"
#import <SVProgressHUD.h>
#import "DisGermTools.h"
#import "DisBamboo.h"
#import "DisapproveGerm.h"
#import "YBSUIPrivacyView.h"
#import "PostedMetodVC.h"
#import "FJPreImageView.h"
#import "YBSYBSportsAlert.h"

@interface YoBoDiscover ()

@end

@implementation YoBoDiscover

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self diaryShow];
}
-(void)diaryShow{
    self.dataSource = [[DisGermTools slidingDiaryShare] getAllDiaryMOdelArr];
    [self.tableView reloadData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
       [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(editClick) title:@"edit_icon"];
    DisapproveGerm * sdtoo = [[DisapproveGerm alloc] init];
    [sdtoo ultimatelyGlobalDusk:@"Orgy"];
    
   self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.mj_header = nil;
    [self.tableView registerNib:[UINib nibWithNibName:@"MunityNoteCell" bundle:nil] forCellReuseIdentifier:@"MunityNoteCell"];
   
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DisBamboo * model = self.dataSource[indexPath.row];
    if (model.dataImageStr) {
        return 285 + [self tableViewForRowAtIndexCellHeight:model.news];
    }else{
        return 100;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DisBamboo * model = self.dataSource[indexPath.row];
    if (model.dataImageStr) {
        MunityNoteCell * noteCell = [tableView dequeueReusableCellWithIdentifier:@"MunityNoteCell" forIndexPath:indexPath];
        noteCell.diaryNoteLabel.text = model.news;
        noteCell.diaryImageView.image = [self Base64StrToUIImage:model.dataImageStr];
        
        if (model.dataImageUrls) {
             noteCell.dataImageUrls.image = [self Base64StrToUIImage:model.dataImageUrls];
        }
        if (model.dataImageUrl) {
              noteCell.dataImageUrl.image = [self Base64StrToUIImage:model.dataImageUrl];
        }
      
        NSArray * arr = [self sepC:model.dateStr];
        noteCell.headImageV.image = [self Base64StrToUIImage:model.headimageStr];
        noteCell.diaryYearLabel.text = [NSString stringWithFormat:@"%@",arr[0]];
        noteCell.diaryMonthLabel.text = [NSString stringWithFormat:@"%@/%@",arr[1],arr[2]];
        [noteCell.zanBtn setTitle:[NSString stringWithFormat:@"%.f",[model.liker floatValue]] forState:UIControlStateNormal];
         [noteCell.shouCangBtn setTitle:[NSString stringWithFormat:@"%.f",[model.collect floatValue]] forState:UIControlStateNormal];
        noteCell.name.text = model.name;
        
        
        __weak typeof(noteCell)WeakSelf = noteCell;
        noteCell.zanblock = ^{
            if ([YoBoDefault isLogin]) {
                if (WeakSelf.zanBtn.isSelected) {
                           WeakSelf.zanBtn.selected = NO;
                           CGFloat zanNum = [WeakSelf.zanBtn.titleLabel.text floatValue];
                           [WeakSelf.zanBtn setTitle:[NSString stringWithFormat:@"%.f",zanNum-1] forState:UIControlStateNormal];
                           [SVProgressHUD showInfoWithStatus:@"取消点赞"];
                       }else{
                           WeakSelf.zanBtn.selected = YES;
                           CGFloat zanNum = [WeakSelf.zanBtn.titleLabel.text floatValue];
                           [WeakSelf.zanBtn setTitle:[NSString stringWithFormat:@"%.f",zanNum+1] forState:UIControlStateNormal];
                           [SVProgressHUD showInfoWithStatus:@"点赞成功"];
                       }
                
                model.liker  = WeakSelf.zanBtn.titleLabel.text;
                [self updateDailyModel:model];
                
            }else{
              [self topresentLoginMetodVC];
            }
       
        };
        noteCell.shoucangBlock = ^{
            
            if ([YoBoDefault isLogin]) {
                if (WeakSelf.shouCangBtn.isSelected) {
                             WeakSelf.shouCangBtn.selected = NO;
                             CGFloat shoucangNum = [WeakSelf.shouCangBtn.titleLabel.text floatValue];
                             [WeakSelf.shouCangBtn setTitle:[NSString stringWithFormat:@"%.f",shoucangNum-1] forState:UIControlStateNormal];
                             [SVProgressHUD showInfoWithStatus:@"取消收藏"];
                         }else{
                             WeakSelf.shouCangBtn.selected = YES;
                             CGFloat shoucangNum = [WeakSelf.shouCangBtn.titleLabel.text floatValue];
                             [WeakSelf.shouCangBtn setTitle:[NSString stringWithFormat:@"%.f",shoucangNum+1] forState:UIControlStateNormal];
                             [SVProgressHUD showInfoWithStatus:@"收藏成功"];
                         }
                         
                         model.collect = WeakSelf.shouCangBtn.titleLabel.text;
                         [self updateDailyModel:model];
            }else{
                
            }
         
            
        };
        noteCell.talkblockAction = ^{
            if ([YoBoDefault isLogin]) {
                YBSYBSportsAlert*sportsAlert = [YBSYBSportsAlert initYBSportsAlertWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) delegate:nil ];
                     [sportsAlert setAnimationType:YBSportsAlertAnimationTypeDefault];
                
                    [sportsAlert YBSDCAlerAnimationConterl:self];
            }else{
                 [self topresentLoginMetodVC];
            }
        
        };
        noteCell.jubaoblock = ^{
            if ([YoBoDefault isLogin]) {

               }else{
                  [self topresentLoginMetodVC];
            }
           
        };
        
        noteCell.pingBiBlock = ^{
          
            if ([YoBoDefault isLogin]) {
                     [self pingBiYheDailyModel:model];
                }else{
                   [self topresentLoginMetodVC];
               }
        };
        return noteCell;
    }
    return nil;
}


-(void)updateDailyModel:(DisBamboo *)model{
    
    [[DisGermTools slidingDiaryShare]updateObjectsLiker:model];
}

-(void)pingBiYheDailyModel:(DisBamboo *)model{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"屏蔽" message:@"屏蔽这条文字和图片？" preferredStyle:UIAlertControllerStyleAlert];
       UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
           NSLog(@"取消");
       }];
       UIAlertAction *sureBtn = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull   action) {
           [[DisGermTools slidingDiaryShare]deleteObjectByFormat:model];
              [self diaryShow];
       }];
       [sureBtn setValue:[UIColor redColor] forKey:@"titleTextColor"];
       [alertVc addAction:cancelBtn];
       [alertVc addAction :sureBtn];
       [self presentViewController:alertVc animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DisBamboo * model = self.dataSource[indexPath.row];
    NSMutableArray * array = [NSMutableArray new];

    [array addObject:model.dataImageStr];

    if ([model.dataImageUrls isNull]) {
        [array addObject:model.dataImageUrls];
    }
    if ([model.dataImageUrl isNull]) {
        [array addObject:model.dataImageUrl];
    }
     
    
    FJPreImageView * imageVc = [[FJPreImageView alloc]init];
          
    [imageVc setLongTapPressBlock:^(UIImage * _Nonnull image) {
              NSLog(@"长按图片回调");
   }];
          
   [imageVc showPreView:[UIApplication sharedApplication].keyWindow urls:array index:0];

}
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    return [UIImage imageNamed:@"icon_data_empty"];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *text = @"  数据空空如也... ";
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f],
       NSForegroundColorAttributeName: [UIColor lightGrayColor]};
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSArray *)sepC:(NSString *)se{
    NSArray * arr = [se componentsSeparatedByString:@"-"];
    return arr;
}

-(UIImage *)Base64StrToUIImage:(NSString *)_encodedImageStr
{
    NSData * decodedImageData = [[NSData alloc] initWithBase64EncodedString:_encodedImageStr options:(NSDataBase64DecodingIgnoreUnknownCharacters)];
    UIImage *_decodedImage = [UIImage imageWithData:decodedImageData];
    return _decodedImage;
}

-(void)editClick{
    
    if ([YoBoDefault isLogin]) {
        PostedMetodVC * homeDetailVC = [[PostedMetodVC alloc] init];
        homeDetailVC.hidesBottomBarWhenPushed = YES;
    
     [self.navigationController pushViewController: homeDetailVC animated:YES];
        
    }else{
        [self topresentLoginMetodVC];
    }
}


-(void)topresentLoginMetodVC{
    
       UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:[YoBoLogin new]];
       [self presentViewController:navc animated:YES completion:nil];
}
@end
