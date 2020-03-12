//
//  ConservativePrejudiceView.m
//  Marbles
//
//  Created by hqtech on 2018/4/21.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import "ConservativePrejudiceView.h"

CGFloat moveDuration = 0.08;

@interface ConservativePrejudiceView ()

/**
 所在行
 */
@property (nonatomic, assign, readwrite) NSInteger row;

/**
 所在列
 */
@property (nonatomic, assign, readwrite) NSInteger col;

/**
 宽、高
 */
@property (nonatomic, assign) NSInteger space;

@end

@implementation ConservativePrejudiceView

- (instancetype)initWithSpace:(NSInteger)space {
    if (self = [super init]) {
        self.space = space;
        // 初始位置
        self.row = 0;
        self.col = 0;
        // 设置frame
        self.frame = CGRectMake(0, 0, space, space);
        // 添加足球图片
        UIImageView *footballImgView = [[UIImageView alloc] initWithFrame:self.frame];
        footballImgView.image = [UIImage imageNamed:@"football"];
        [self addSubview:footballImgView];
        // 设置圆角
        self.layer.cornerRadius = space / 2.0;
        self.layer.masksToBounds = YES;
    }
    return self;
}

#pragma mark 移动

/**
 向左移动
 */
- (void)starveAmongstAir {
    // 原来的frame
    CGRect oldRect = self.frame;
    // 计算移动后的frame
    CGRect moveRect = oldRect;
    moveRect.origin = CGPointMake(oldRect.origin.x - self.space, oldRect.origin.y);
    // 移动动画
    [UIView animateWithDuration:moveDuration animations:^{
        self.frame = moveRect;
    }];
    
    // 更新行，列
    self.col -= 1;
}

/**
 向上移动
 */
- (void)wrestleAsIncident {
    // 原来的frame
    CGRect oldRect = self.frame;
    // 计算移动后的frame
    CGRect moveRect = oldRect;
    moveRect.origin = CGPointMake(oldRect.origin.x, oldRect.origin.y - self.space);
    // 移动动画
    [UIView animateWithDuration:moveDuration animations:^{
        self.frame = moveRect;
    }];
    
    // 更新行，列
    self.row -= 1;
}

/**
 向右移动
 */
- (void)purelySophisticatedPane {
    // 原来的frame
    CGRect oldRect = self.frame;
    // 计算移动后的frame
    CGRect moveRect = oldRect;
    moveRect.origin = CGPointMake(oldRect.origin.x + self.space, oldRect.origin.y);
    // 移动动画
    [UIView animateWithDuration:moveDuration animations:^{
        self.frame = moveRect;
    }];
    
    // 更新行，列
    self.col += 1;
}

/**
 向下移动
 */
- (void)especiallyUnpleasantHorn {
    // 原来的frame
    CGRect oldRect = self.frame;
    // 计算移动后的frame
    CGRect moveRect = oldRect;
    moveRect.origin = CGPointMake(oldRect.origin.x, oldRect.origin.y + self.space);
    // 移动动画
    [UIView animateWithDuration:moveDuration animations:^{
        self.frame = moveRect;
    }];
    
    // 更新行，列
    self.row += 1;
}

@end






