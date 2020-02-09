#import "CommunityVC.h"
#import "UserDefaultManager.h"
#import "MunityNoteCell.h"
#import <SVProgressHUD.h>
#import "DisGermTools.h"
#import "DisBamboo.h"
#import "DisapproveGerm.h"
#import "DeepenPleasurableTennisView.h"
#import "DiscussGerm.h"
#import "PostedMetodVC.h"
#import "FJPreImageView.h"
@interface CommunityVC ()

@end


@implementation CommunityVC

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
    
    self.tableView.mj_header = nil;
    [self.tableView registerNib:[UINib nibWithNibName:@"MunityNoteCell" bundle:nil] forCellReuseIdentifier:@"SDDiarySetNoteCellID"];
   
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DisBamboo * model = self.dataSource[indexPath.row];
    if (model.dataImageStr) {
        return 285 + [self tableViewForRowAtIndexCellHeight:model.news];
    }else{
        return 100;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
   static NSString * str = @"SDFooterViewID";
    DeepenPleasurableTennisView * footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:str];
    return footerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DisBamboo * model = self.dataSource[indexPath.row];
    if (model.dataImageStr) {
        MunityNoteCell * noteCell = [tableView dequeueReusableCellWithIdentifier:@"SDDiarySetNoteCellID" forIndexPath:indexPath];
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
            if ([UserDefaultManager isLogin]) {
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
                 [LatelyMetodRouter switchTopresentLoginMetodVC:self];
            }
       
        };
        noteCell.shoucangBlock = ^{
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
            
        };
        noteCell.talkblockAction = ^{
            if ([UserDefaultManager isLogin]) {
                DiscussGerm * OrgyView = [[DiscussGerm alloc] init];
                [self.view.window addSubview:OrgyView];
            }else{
                 [LatelyMetodRouter switchTopresentLoginMetodVC:self];
            }
        
        };
        noteCell.jubaoblock = ^{
            if ([UserDefaultManager isLogin]) {
                 
               }else{
                  [LatelyMetodRouter switchTopresentLoginMetodVC:self];
            }
           
        };
        noteCell.pingBiBlock = ^{
            [self pingBiYheDailyModel:model];
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
    
    if ([UserDefaultManager isLogin]) {
       // [LatelyMetodRouter switchTopushPostedMetodVC:self];
        PostedMetodVC * homeDetailVC = [[PostedMetodVC alloc] init];
        homeDetailVC.hidesBottomBarWhenPushed = YES;
        homeDetailVC.loadBlock = ^{
               [self diaryShow];
        };
     [self.navigationController pushViewController: homeDetailVC animated:YES];
        
    }else{
         [LatelyMetodRouter switchTopresentLoginMetodVC:self];
    }
}

@end
