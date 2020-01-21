//
//  ExNSUserDefault.h
//  UIKitExpand
//
//  Created by 童公放 on 2017/8/15.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExNSUserDefault : NSObject
+(instancetype)sharedDefaultManager;
-(void)saveUserKeyNamed:(id)key;
- (void)removeAllDefaults;
@end
