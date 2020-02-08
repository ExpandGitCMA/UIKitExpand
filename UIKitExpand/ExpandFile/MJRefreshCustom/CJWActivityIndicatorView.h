//
//  CJWActivityIndicatorView.h
//  OShop_iOS
//
//  Created by Yunxin.Li on 16/4/5.
//  Copyright © 2016年 CJW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SportsBallFile.h"
@interface CJWActivityIndicatorView : UIView

@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) CGFloat radius;
@property (nonatomic) UIColor *tintColor;
@property (nonatomic) UIView *backgroundView;

- (void)startAnimating;
- (void)stopAnimating;

@end