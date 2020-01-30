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
