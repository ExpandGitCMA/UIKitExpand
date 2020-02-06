#import "CoordinateDinosaur.h"
#import "UnderlineDizzyTable.h"
#import "SportsBallFile.h"
@interface CoordinateDinosaur ()<UIWebViewDelegate>
@property(nonatomic,copy)NSString *url;
@property(nonatomic,strong)UIWebView*webView;
@end
@implementation CoordinateDinosaur
-(instancetype)initWithUrl:(NSString*)url{
    if(self = [super init]){
        _url=url;
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UnderlineDizzyTable showActivityIndicator];
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
    [UnderlineDizzyTable hideActivityIndicator];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [UnderlineDizzyTable hideActivityIndicator];
}
-(void)webViewDidStartLoad:(UIWebView*)webView {
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end


