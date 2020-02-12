//
//  YoBoUploadhotView.h
//  OShop_iOS
//
//  Created by ZeroSmile on 2017/9/27.
//  Copyright © 2017年 CJW. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YoBoUploadhotCell;

@protocol YoBoUploadDelegate <NSObject>
@optional
- (void)uploadHot:(YoBoUploadhotCell *)uploadHot  switchIndex:(NSInteger)switchIndex;

@end


@interface YoBoUploadhotCell : UICollectionViewCell
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) NSInteger maxCount;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) BOOL deleted;
@property (nonatomic, weak) id <YoBoUploadDelegate> delegate;
@end


typedef void (^MaxCountBlock)(NSInteger  maxCount);

@interface YoBoUploadhotView : UIView
@property (nonatomic,copy)MaxCountBlock countBlock;
@property (nonatomic, strong) NSMutableArray *icons;
@property (nonatomic, assign) NSUInteger maxCount;
@end
