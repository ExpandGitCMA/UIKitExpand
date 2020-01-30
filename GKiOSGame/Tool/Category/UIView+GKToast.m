//
//  UIView+GKToast.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/17.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "UIView+GKToast.h"

@implementation UIView (GKToast)
- (void)showMessage:(NSString *)message{
    [self showMessage:message duration:2.0 position:CSToastPositionCenter];
}
- (void)showMessage:(NSString *)message
           duration:(NSTimeInterval)duration
           position:(id)position{
    CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle];
    style.backgroundColor = [UIColor colorWithRGB:0x000000 alpha:0.35];
    style.cornerRadius = AppRadius;
    style.titleFont = [UIFont systemFontOfSize:14];
    [self showMessage:message duration:duration position:position style:style];
}
- (void)showMessage:(NSString *)message
           duration:(NSTimeInterval)duration
           position:(id)position
              style:(CSToastStyle *)style{
    [CSToastManager setQueueEnabled:YES];
    [self makeToast:message duration:duration position:position style:style];
}
@end
