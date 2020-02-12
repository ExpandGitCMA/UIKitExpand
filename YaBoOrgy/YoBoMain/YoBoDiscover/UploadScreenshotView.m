//
//  UploadScreenshotView.m
//  OShop_iOS
//
//  Created by ZeroSmile on 2017/9/27.
//  Copyright © 2017年 CJW. All rights reserved.
//

#import "UploadScreenshotView.h"
#import "UIView+SDExtension.h"
#import "InvestigateFate.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/PHPhotoLibrary.h>
@interface CJWUploadScreenshotCell ()
@property (nonatomic ,weak) UIImageView *imageView;
@property (nonatomic, weak) UIButton *close;
@end

@implementation CJWUploadScreenshotCell

- (UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.userInteractionEnabled = YES;
        [self addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}

- (UIButton *)close{
    if (!_close) {
        UIButton *close =[[UIButton alloc] initWithFrame:CGRectZero];
        [close setImage:[UIImage imageNamed:@"btn_close"] forState:UIControlStateNormal];
        close.imageView.contentMode = UIViewContentModeScaleToFill;
        [close addTarget:self action:@selector(deleteShotCell:) forControlEvents:UIControlEventTouchUpInside];
        close.hidden = YES;
        [self.imageView addSubview:close];
        _close = close;
    }
    return _close;
}

- (void)deleteShotCell:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(deleteCell:iconViewindex:)]&&self.delegate) {
        [self.delegate deleteCell:self iconViewindex:self.index];
    }
}


- (void)setImage:(UIImage *)image{
    self.imageView.image = image;
    if (self.index == self.maxCount && self.maxCount) {
        self.imageView.hidden = YES;
    }else{
        self.imageView.hidden = NO;
    }
}

-(void)setDeleted:(BOOL)deleted{
    _deleted = deleted;
    self.close.hidden = !deleted;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _imageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
     _close.frame = CGRectMake(CGRectGetWidth(self.bounds)-20, -10, 30, 30);
}

@end


@interface UploadScreenshotView ()<UploadShotCellDelegate,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIActionSheetDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL isCanClick;
@property (nonatomic, assign) NSInteger indexPath;
@property (nonatomic, strong) UIImagePickerController *picker;
@end

static NSString * const reuseIdentifier = @"Cell";
@implementation UploadScreenshotView
-(instancetype)initWithFrame:(CGRect)frame
{
   
    if (self = [super initWithFrame:frame]) {
        [self.collectionView registerClass:[CJWUploadScreenshotCell class] forCellWithReuseIdentifier:reuseIdentifier];
        [self addSubview:self.collectionView];
    }
    return self;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 0);
        flowLayout.itemSize = CGSizeMake(85, 85);
        flowLayout.minimumLineSpacing = 10;
       flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.icons.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CJWUploadScreenshotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    cell.index = indexPath.row;
    cell.maxCount = self.maxCount;
    cell.image = [self.icons SafetyObjectAtIndex:indexPath.row];
    if (indexPath.row==self.icons.count-1) {
          cell.deleted = NO;
    }else{
          cell.deleted = YES;
    }
    return cell;
}


-(void)deleteCell:(CJWUploadScreenshotCell *)deleteCell iconViewindex:(NSInteger)iconViewindex{
    
    if (iconViewindex<self.icons.count) {
        [self.icons removeObjectAtIndex:iconViewindex];
    }
    if (self.countBlock) {
        self.countBlock(_icons.count-1);
    }
    [self.collectionView reloadData];

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.icons.count>3) {
        return;
    }
    if (indexPath.row!=self.icons.count-1){
          return;
    }

    [self gestureACtion];
}


- (void)gestureACtion{
    UIAlertController *alertController;
    __block NSUInteger blockSourceType = 0;
    
    //支持访问相机与相册情况
    alertController = [UIAlertController alertControllerWithTitle:@"选择图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:@"从相册中选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //相册
        blockSourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = blockSourceType;
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        
        if (status == PHAuthorizationStatusNotDetermined) {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if(status == PHAuthorizationStatusAuthorized) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // 用户点击 "OK"
                        
                    });
                } else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // 用户点击 不允许访问
                        [[self viewController] dismissViewControllerAnimated:YES completion:nil];
                    });
                }
            }];
            
            [[self viewController] presentViewController:imagePickerController animated:YES completion:nil];
        }else if(status == PHAuthorizationStatusDenied || status == PHAuthorizationStatusRestricted){
            NSLog(@"buyunxu");
            // 无权限
            NSString *msg = @"请在iPhone的”设置-隐私-照片“选项中，允许该应用访问你的照片。";
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:cancelAction];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [[self viewController] presentViewController:alertController animated:YES completion:nil];
            });
            
        }else{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [[self viewController] presentViewController:imagePickerController animated:YES completion:nil];
            });
            
        }
        
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"相机拍摄" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            //相机
            blockSourceType = UIImagePickerControllerSourceTypeCamera;
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.delegate = self;
            imagePickerController.allowsEditing = YES;
            imagePickerController.sourceType = blockSourceType;
            //相机权限
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if (authStatus ==AVAuthorizationStatusRestricted ||//此应用程序没有被授权访问的照片数据。可能是家长控制权限
                authStatus ==AVAuthorizationStatusDenied)  //用户已经明确否认了这一照片数据的应用程序访问
            {
                // 无权限
                NSString *msg = @"请在iPhone的”设置-隐私-相机“选项中，允许该应用访问你的相机。";
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleCancel handler:nil];
                [alertController addAction:cancelAction];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [[self viewController] presentViewController:alertController animated:YES completion:nil];
                });
            }else if(authStatus == AVAuthorizationStatusNotDetermined){
                ([AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if (granted == YES) {
                    }else{
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [[self viewController] dismissViewControllerAnimated:YES completion:nil];
                        });
                    }
                }]);
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [[self viewController] presentViewController:imagePickerController animated:YES completion:nil];
            });
        }
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        return;
    }]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[self viewController] presentViewController:alertController animated:YES completion:nil];
    });
}


#pragma mark - UIActionSheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]&&[[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied || authStatus ==AVAuthorizationStatusDenied){
                
              [self alertViewShow];
            } else {//调用相机
          
                [self picker];
                [self takePickerController:buttonIndex];
            }
    }else  if ([UIImagePickerController isSourceTypeAvailable:   UIImagePickerControllerSourceTypePhotoLibrary]&&[[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0){
        [self picker];
        [self takePickerController:1];
    }else{
        [self alertViewShow];
    }
}

-(UIImagePickerController *)picker{
    if (!_picker) {
        _picker = [[UIImagePickerController alloc] init];
    }
    return _picker;
}

-(void)takePickerController:(NSInteger)buttonIndex{
    _picker.delegate = self;
    _picker.allowsEditing = YES;
    switch (buttonIndex) {
        case 0:{ //拍照
            _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
          [[self viewController] presentViewController:_picker animated:YES completion:NULL];
        }
            break;
        case 1:{ //相册
            _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [[self viewController] presentViewController:_picker animated:YES completion:NULL];
        }
            break;
        default:
            break;
    }
}

#pragma mark - UIImagePickerViewDelegate-拍照相册
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
   [self.icons insertObject:image atIndex:self.icons.count - 1];
    [picker dismissViewControllerAnimated:YES completion:^{
        if (self.countBlock) {
            self.countBlock(_icons.count-1);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [_picker dismissViewControllerAnimated:YES completion:nil];
    
}



-(void)alertViewShow{
    UIAlertView * alart = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请您设置允许APP访问您的相机\n设置>隐私>相机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alart show];
    return;
}

- (NSMutableArray *)icons
{
    if (!_icons) {
        _icons = [[NSMutableArray alloc] init];
        [_icons addObject:[UIImage imageNamed:@"addUpload"]];
    }
    return _icons;
}

@end
