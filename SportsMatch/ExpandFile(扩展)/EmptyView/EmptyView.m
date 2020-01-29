//
//  EmptyView.m
//  SportsMatch
//
//  Created by Smell Zero on 2020/1/29.
//  Copyright © 2020 陈美安. All rights reserved.
//

#import "EmptyView.h"
#import "AppColorHeader.h"
static NSString *FDMSG_Home_DataEmpty    = @"数据空空如也...";

@interface EmptyView ()

@end

@implementation EmptyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image  = [UIImage imageNamed:@"icon_data_empty"];
        self.contentMode =   UIViewContentModeCenter;
        
        UILabel *tip = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bounds.size.height/2+50, self.bounds.size.width, 50)];
        tip.textAlignment =  NSTextAlignmentCenter;
        tip.textColor = kUIColorFromRGB(Appx999999);
        tip.text = FDMSG_Home_DataEmpty;
        [self addSubview:tip];
    }
    return self;
}
@end
