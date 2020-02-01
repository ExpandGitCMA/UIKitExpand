#import "DFCWebViewCode.h"
#import "DFCStatusUtility.h"
#import "AppHeaderFile.h"
@interface DFCWebViewCode ()<UIWebViewDelegate>
@property(nonatomic,copy)NSString *url;
@property(nonatomic,strong)UIWebView*webView;
@end
@implementation DFCWebViewCode
-(instancetype)initWithUrl:(NSString*)url{
    if(self = [super init]){
        _url=url;
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [DFCStatusUtility showActivityIndicator];
    self.navigationController.navigationBar.hidden=NO;
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.navigationController.navigationBar.hidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _webView.delegate=self;
    NSURL *webViewurl = [NSURL URLWithString:_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:webViewurl];
    [_webView loadRequest:request];
    _webView.scrollView.bounces = NO;
    _webView.scalesPageToFit = NO;
    [self.view addSubview:_webView];
}
#pragma mark  UIWebView代理方法-----点击事件
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [DFCStatusUtility hideActivityIndicator];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [DFCStatusUtility hideActivityIndicator];
}
-(void)webViewDidStartLoad:(UIWebView*)webView {
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
