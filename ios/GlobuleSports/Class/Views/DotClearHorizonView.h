//
//  DotClearHorizonView.h
//  Marbles
//
//  Created by hqtech on 2018/4/20.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttemptSinger.h"

@interface DotClearHorizonView : UIView

@property (nonatomic, assign) NSInteger rows;

@property (nonatomic, assign) NSInteger cols;

@property (nonatomic, assign) NSInteger space;

@property (nonatomic, strong) NSMutableArray<AttemptSinger *> *mazeCells;

@end






