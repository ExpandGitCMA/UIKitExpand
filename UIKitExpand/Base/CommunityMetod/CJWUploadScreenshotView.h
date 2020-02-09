//
//  CJWUploadScreenshotView.h
//  OShop_iOS
//
//  Created by ZeroSmile on 2017/9/27.
//  Copyright © 2017年 CJW. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJWUploadScreenshotCell;

@protocol UploadShotCellDelegate <NSObject>
@optional
- (void)deleteCell:(CJWUploadScreenshotCell *)deleteCell  iconViewindex:(NSInteger)iconViewindex;

@end


@interface CJWUploadScreenshotCell : UICollectionViewCell
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) NSInteger maxCount;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) BOOL deleted;
@property (nonatomic, weak) id <UploadShotCellDelegate> delegate;
@end


typedef void (^MaxCountBlock)(NSInteger  maxCount);

@interface CJWUploadScreenshotView : UIView
@property (nonatomic,copy)MaxCountBlock countBlock;
@property (nonatomic, strong) NSMutableArray *icons;
@property (nonatomic, assign) NSUInteger maxCount;
@end
