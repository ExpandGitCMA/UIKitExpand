//
//  ShoweryCalendarManager.h
//  UIKitExpand
//
//  Created by 童公放 on 2017/8/4.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AcademicFinding.h"
@interface ShoweryCalendarManager : NSObject
@property (nonatomic,readonly) AcademicFinding *user;
+(instancetype)sharedDefaultManager;
- (void)glideWithinWrongLeak:(AcademicFinding *)user;
- (void)searchBruise;
@end


