//
//  LodingActivity.m
//  UIKitExpand
//
//  Created by admin on 8/2/2020.
//  Copyright © 2020 陈美安. All rights reserved.
//

#import "LodingActivity.h"
#import "CJWActivityIndicatorView.h"
#import "SportsBallFile.h"





@interface LodingActivity()
@property (strong, nonatomic) CJWActivityIndicatorView *loading;
@end
@implementation LodingActivity


-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        
           self.backgroundColor = [UIColor colorWithRed:(0)/255.0f green:(0)/255.0f blue:(0)/255.0f alpha:(0.7)];
           self.layer.cornerRadius = 10;
           self.layer.masksToBounds=YES;
           self.layer.borderColor = [UIColor grayColor].CGColor;
           self.layer.borderWidth= 0;
        
          _loading = [[CJWActivityIndicatorView alloc] initWithFrame:CGRectMake(0,0,50, 50)];
         [_loading startAnimating];
         [self addSubview:_loading];
         _loading.center = self.center;
        
    }
    return self;
}


-(void)stopAnimating{
     [_loading stopAnimating];
}

@end
