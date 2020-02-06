//
//  UITableView+XSAnimationKit.m
//  TableViewAnimationKit-OC
//
//  Created by 王小树 on 17/9/9.
//  Copyright © 2017年 com.cn.fql. All rights reserved.
//

#import "UITableView+XSAnimationKit.h"
#import "WarnGiantBar.h"

@implementation UITableView (XSAnimationKit)

- (void)xs_showTableViewAnimationWithType:(XSTableViewAnimationType)animationType{
    [WarnGiantBar showWithAnimationType:animationType tableView:self];
}

@end


