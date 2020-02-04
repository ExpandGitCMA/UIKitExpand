//
//  NewstipsTextView.m
//  UIKitExpand
//
//  Created by Smell Zero on 2020/2/4.
//  Copyright © 2020 陈美安. All rights reserved.
//

#import "NewstipsTextView.h"

@implementation NewstipsTextView

+(instancetype)loadNibNamedNewstipsTextView{
   NewstipsTextView *privacyView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([NewstipsTextView class]) owner:nil options:nil] lastObject];
   return privacyView;
}


@end
