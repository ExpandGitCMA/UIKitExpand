#import "CoordinateDinosaur.h"
#import "UnderlineDizzyTable.h"
#import "SportsMacrosHeadr.h"
#import <MJRefresh.h>
@interface CoordinateDinosaur ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
{
    WKWebView *webView;
    NSArray *lanjiArr;
    NSArray * bottomArr;
    UIScrollView * scr;
    UIDeviceOrientation ori;
}
@property(nonatomic,copy)NSString *url;
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
    self.navigationController.navigationBar.hidden=NO;
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [UnderlineDizzyTable hideActivityIndicator];
    self.navigationController.navigationBar.hidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   NSMutableString *javascript = [NSMutableString string];
    [javascript appendString:@"document.documentElement.style.webkitTouchCallout='none';"];
    WKUserScript *noneSelectScript = [[WKUserScript alloc] initWithSource:javascript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];
    [userContentController addScriptMessageHandler:[[WKScriptMessageDelegate alloc] initWithDelegate:self] name:@"message"];
    [userContentController addUserScript:noneSelectScript];
   WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
   configuration.userContentController = userContentController;
    WKPreferences *preferences = [WKPreferences new];
    preferences.javaScriptEnabled = YES;
    preferences.javaScriptCanOpenWindowsAutomatically = YES;
    preferences.minimumFontSize = 0.0;
    configuration.preferences = preferences;
    webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) configuration:configuration];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    webView.scrollView.bounces = NO;
    [self.view addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    webView.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self->webView reload];
    }];
}
#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
      [UnderlineDizzyTable showActivityIndicator];
}
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
   [webView.scrollView.mj_header endRefreshing];
    [UnderlineDizzyTable hideActivityIndicator];
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
     [webView.scrollView.mj_header endRefreshing];
     [UnderlineDizzyTable hideActivityIndicator];
}
-(void)setCodeAliment:(WebViewCodeAliment)codeAliment{
    if (codeAliment==WebViewCodeCenter) {
        [self.navigationController.navigationItem setHidesBackButton:YES];
        [self.navigationItem setHidesBackButton:YES];
        [self.navigationController.navigationBar.backItem setHidesBackButton:YES];
    }
}
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
   DEBUG_NSLog(@"接收到服务器跳转请求之后调用=%@",webView.URL.absoluteString);
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    NSString*absoluteString = navigationResponse.response.URL.absoluteString;
    NSURL *URL = navigationResponse.response.URL;
    if ([absoluteString containsString:@"load_ty"]) {
        [[UIApplication sharedApplication]openURL:URL options:@{} completionHandler:^(BOOL success) {  }];
         decisionHandler(WKNavigationResponsePolicyCancel);
    }else{
         decisionHandler(WKNavigationResponsePolicyAllow);
    }
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
}
#pragma mark - WKUIDelegate
- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    WKFrameInfo *frameInfo = navigationAction.targetFrame;
    if (![frameInfo isMainFrame]) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler{
    completionHandler(@"http");
}
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler{
    completionHandler(YES);
}
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    NSLog(@"%@",message);
    completionHandler();
}
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"--------\n%@", message.body);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)dealloc {
    [  webView.configuration.userContentController removeScriptMessageHandlerForName:@"message"];
}
@end
@implementation WKScriptMessageDelegate
- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)delegate {
    self = [super init];
    if (self) {
        self.scriptMessageDelegate = delegate;
    }
    return self;
}
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    [self.scriptMessageDelegate userContentController:userContentController didReceiveScriptMessage:message];
}
@end
