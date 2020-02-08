//
//  CJWProgressView.h
//  OShop_iOS
//
//  Created by Yunxin.Li on 16/4/3.
//  Copyright © 2016年 CJW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SportsBallFile.h"
@interface CJWProgressView : UIView

@property (nonatomic) CGFloat progress;

@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) CGFloat radius;
@property (nonatomic) UIColor *tintColor;
@property (nonatomic) UIView *backgroundView;
@property (nonatomic) CAShapeLayer *progressLayer;
@property (nonatomic) UIImageView *iconImgV;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
