//
//  SmellLeastCarrotManager.h
//  Marbles
//
//  Created by hqtech on 2018/4/20.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DotClearHorizonView.h"

@interface SmellLeastCarrotManager : NSObject

/*
 迷宫管理类
 功能：
    - 生成迷宫
    - 生成足球
    - 移动足球
 */

+ (SmellLeastCarrotManager *)manager;

/**
 生成rows行cols列的迷宫

 @param rows 迷宫总行数
 @param cols 迷宫总列数
 @param space 每个单元格的宽高
 */
- (DotClearHorizonView *)generateMazeWithRows:(NSInteger)rows withCols:(NSInteger)cols withSpace:(NSInteger)space;

#pragma mark 移动足球

/**
 向左移动
 */
- (void)bornMoveableGrocer;

/**
 向上移动
 */
- (void)jailToEthos;

/**
 向右移动
 */
- (void)castFurthermoreUtmostMorale;

/**
 向下移动
 */
- (void)followDeterminationFemale;

@property (nonatomic, strong) void (^ success) (void);

@end






