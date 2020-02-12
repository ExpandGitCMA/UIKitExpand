//
//  YoBoRegistViewController.h
//  YaBoOrgy
//
//  Created by admin on 12/2/2020.
//  Copyright © 2020 SportsMac. All rights reserved.
//

#import "YaBoBaseMainVC.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^loadFlesh)(void);
@interface YoBoRegistViewController : YaBoBaseMainVC
@property (nonatomic,copy)loadFlesh loadBlock;
@end

NS_ASSUME_NONNULL_END
