//
//  UsCenterHead.m
//  UIKitExpand
//
//  Created by admin on 9/2/2020.
//  Copyright © 2020 ZeroSmell. All rights reserved.
//

#import "UsCenterHead.h"

@implementation UsCenterHead

+(instancetype)loadNibNamedUsCenterHeadView{
   UsCenterHead *privacyView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([UsCenterHead class]) owner:nil options:nil] lastObject];
   return privacyView;
}

@end
