//
//  ExpandButton.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/14.
//  Copyright © 2017年 陈美安. All rights reserved.
//

#import "ExpandSearch.h"
#import "ExplandStyle.h"
@implementation ExpandSearch

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initSearch];
    }
    return self;
}

-(void)initSearch{
    self.backgroundColor = kUIColorFromRGB(ExSearch);
    [self searchNormalStyle];
    [self setImage:[[UIImage imageNamed:@"img_search_icon"] localizeFitImage] forState:UIControlStateNormal];
    self.adjustsImageWhenHighlighted = NO;
    [self setTitle:@"夏季优惠60%的折扣" forState:UIControlStateNormal];
    self.titleLabel.font = [ExplandStyle fontWithSize:14];
    [self setTitleColor:kUIColorFromRGB(ExAddress) forState:UIControlStateNormal];
    if (ISRIGHTTOLEFT) {
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    } else {
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    }
}

- (void)homeStyleWithColor:(UIColor *)color alpha:(CGFloat)alpha {
    self.backgroundColor = color;
    self.alpha = alpha;
}
@end
