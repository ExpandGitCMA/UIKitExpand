//
//  UIView+GKToast.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/17.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIView (GKToast)
- (void)showMessage:(NSString *)message;
- (void)showMessage:(NSString *)message
duration:(NSTimeInterval)duration
           position:(id)position;
- (void)showMessage:(NSString *)message
           duration:(NSTimeInterval)duration
           position:(id)position
              style:(CSToastStyle *)style;
@end


