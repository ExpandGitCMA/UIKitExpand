//
//  RuleReferralVC.m
//  GlobuleSports
//
//  Created by admin on 11/3/2020.
//  Copyright © 2020 Globule. All rights reserved.
//

#import "RuleReferralVC.h"
#import <React/RCTBridgeDelegate.h>
#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
@interface RuleReferralVC ()<RCTBridgeDelegate>

@end

@implementation RuleReferralVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:nil];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                         moduleName:@"FansGlobe"
                                                  initialProperties:nil];
    rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
    self.view = rootView;

}


- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
   return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
#else
     return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}
@end
