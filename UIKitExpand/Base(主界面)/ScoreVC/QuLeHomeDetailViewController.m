//
//  QuLeHomeDetailViewController.m
//  QuLeZuQiu
//
//  Created by 疯子 on 2019/12/27.
//  Copyright © 2019 fengzi. All rights reserved.
//

#import "QuLeHomeDetailViewController.h"

@interface QuLeHomeDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *QuLeHomeDetailImageV;
@property (weak, nonatomic) IBOutlet UITextView *QuLeDetailTextView;

@end

@implementation QuLeHomeDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.QuLeDetailTextView.editable = NO;
    if (self.conten) {
          self.QuLeDetailTextView.text = self.conten;
           
    }else{
          self.QuLeDetailTextView.text = self.title;
    }
  
    
}



@end
