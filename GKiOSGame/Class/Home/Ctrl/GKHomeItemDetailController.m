//
//  GKHomeItemDetailController.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/11.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKHomeItemDetailController.h"
#import "BaseWebController.h"
@interface GKHomeItemDetailController ()<ProgressWKDelegate>
@property (copy, nonatomic) NSString *itemId;
@property (strong, nonatomic) BaseWebController *webView;
@end

@implementation GKHomeItemDetailController
- (void)dealloc{
    
}
+ (instancetype)vcWithItemId:(NSString *)itemId{
    GKHomeItemDetailController *vc = [[[self class] alloc] init];
    vc.itemId = itemId;
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self showNavTitle:@"资讯"];
    [self setupEmpty:self.tableView];
    [self setupRefresh:self.tableView option:ATRefreshNone];
    [self addChildViewController:self.webView];
    [self.view addSubview:self.webView.webView];
    [self.webView.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.webView.webView.superview);
    }];
    self.webView.webView.hidden = YES;
}
- (void)refreshData:(NSInteger)page{

    [self.webView loadURLString:self.itemId];
//    [GKHomeNetManager detail:@"d" newsId:self.itemId success:^(id  _Nonnull object) {
//        [self.webView loadHTMLString:object[@"content"]];
//    } failure:^(NSString * _Nonnull error) {
//        [self endRefreshFailure];
//    }];
}
#pragma mark ProgressWKDelegate
- (void)fdwebView:(ProgressWKWebView *)webview didFinishLoadingURL:(NSURL *)URL{
    [self endRefresh:NO];
    self.tableView.hidden = YES;
    self.webView.webView.hidden = !self.tableView.hidden;
}
- (void)fdwebView:(ProgressWKWebView *)webview didFailToLoadURL:(NSURL *)URL error:(NSError *)error{
    [self endRefreshFailure];
    self.tableView.hidden = NO;
    self.webView.webView.hidden = !self.tableView.hidden;
}
- (void)fdwebViewDidStartLoad:(ProgressWKWebView *)webview{
    
}
- (BaseWebController *)webView{
    if (!_webView) {
        _webView = [[BaseWebController alloc] init];
        _webView.webView.delegate = self;
        [_webView removeFromParentViewController];
    }
    return _webView;
}

@end
