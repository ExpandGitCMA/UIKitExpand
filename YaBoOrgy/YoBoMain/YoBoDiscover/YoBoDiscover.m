//
//  YoBoDiscover.m
//  YaBoOrgy
//
//  Created by admin on 12/2/2020.
//  Copyright © 2020 SportsMac. All rights reserved.
//

#import "YoBoDiscover.h"
#import "YoBoDefault.h"
#import "YoBoNoteCell.h"
#import <SVProgressHUD.h>
#import "YoBoGermTools.h"
#import "YoBoDisModel.h"
#import "DisGermUserModel.h"
#import "YoBoDiscuss.h"
#import "YoPostGamBitVC.h"
#import "FJPreImageView.h"
#import "YoBoAlert.h"

@interface YoBoDiscover ()

@end

@implementation YoBoDiscover

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self diaryShow];
}
-(void)diaryShow{
    self.dataSource = [[YoBoGermTools toolsShareManer] getToolsOdelArr];
    [self.tableView reloadData];

}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUIView];
    DisGermUserModel * sdtoo = [[DisGermUserModel alloc] init];
    [sdtoo initUserModel:@"NewsOrgy"];
}


-(void)initUIView{
   [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(editClick) title:@"edit_icon"];
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.mj_header = nil;
    [self.tableView registerNib:[UINib nibWithNibName:@"YoBoNoteCell" bundle:nil] forCellReuseIdentifier:@"YoBoNoteCell"];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    YoBoDisModel * model = self.dataSource[indexPath.row];
    if (model.imageStr) {
        return 285 + [self tableViewForRowAtIndexCellHeight:model.news];
    }else{
        return 100;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YoBoDisModel * model = self.dataSource[indexPath.row];
    if (model.imageStr) {
        YoBoNoteCell * noteCell = [tableView dequeueReusableCellWithIdentifier:@"YoBoNoteCell" forIndexPath:indexPath];
        noteCell.diaryNoteLabel.text = model.news;
        noteCell.diaryImageView.image = [self Base64StrToUIImage:model.imageStr];
        
        if (model.imageUrls) {
             noteCell.imageUrls.image = [self Base64StrToUIImage:model.imageUrls];
        }
        if (model.imageUrl) {
              noteCell.imageUrl.image = [self Base64StrToUIImage:model.imageUrl];
        }
      
        NSArray * arr = [self sepC:model.timer];
        noteCell.headImageV.image = [self Base64StrToUIImage:model.headimage];
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
                
                YoBoAlert*alert = [YoBoAlert initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) delegate:nil ];
                [alert showAlerAnimationConterl:self];
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


-(void)updateDailyModel:(YoBoDisModel *)model{
    
    [[YoBoGermTools toolsShareManer]updateObjectsLiker:model];
}

-(void)pingBiYheDailyModel:(YoBoDisModel *)model{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"屏蔽" message:@"屏蔽这条文字和图片？" preferredStyle:UIAlertControllerStyleAlert];
       UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
           NSLog(@"取消");
       }];
       UIAlertAction *sureBtn = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull   action) {
           [[YoBoGermTools toolsShareManer]deleteObject:model];
              [self diaryShow];
       }];
       [sureBtn setValue:[UIColor redColor] forKey:@"titleTextColor"];
       [alertVc addAction:cancelBtn];
       [alertVc addAction :sureBtn];
       [self presentViewController:alertVc animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YoBoDisModel * model = self.dataSource[indexPath.row];
    NSMutableArray * array = [NSMutableArray new];

    [array addObject:model.imageStr];

    if ([model.imageUrls isNull]) {
        [array addObject:model.imageUrls];
    }
    if ([model.imageUrl isNull]) {
        [array addObject:model.imageUrl];
    }
     
    
    FJPreImageView * imageVc = [[FJPreImageView alloc]init];
          
    [imageVc setLongTapPressBlock:^(UIImage * _Nonnull image) {
             
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
        YoPostGamBitVC * homeDetailVC = [[YoPostGamBitVC alloc] init];
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
