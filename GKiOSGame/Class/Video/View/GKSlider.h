//
//  GKSlider.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/12.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GKSlider : UISlider
@property (strong, nonatomic) UIProgressView *progressView;
@property (assign, nonatomic) BOOL progress;
@end

NS_ASSUME_NONNULL_END
