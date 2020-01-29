#import "BestMannerController.h"



@interface BestMannerController ()<WKUIDelegate, WKNavigationDelegate, UIScrollViewDelegate>{
    WKWebView *_wkview;
    UIProgressView *_progressView;
    UIScrollView *scrollView;
}
@end

@implementation BestMannerController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_wkview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
     [self initWKWebview];
     [self initProgressview];
}



#pragma mark - WKNavigationDelegate
//追踪加载过程
//在发送请求之前，决定是否跳转
// 类似 UIWebView 的 -webView: shouldStartLoadWithRequest: navigationType:
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
//    decisionHandler(WKNavigationActionPolicyCancel);
}

//页面加载时调用
// 类似UIWebView的 -webViewDidStartLoad:
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    _progressView.hidden = NO;
}

//在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    decisionHandler(WKNavigationResponsePolicyAllow);
//    decisionHandler(WKNavigationResponsePolicyCancel);
}

//当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    
}

//页面加载完成后调用
// 类似 UIWebView 的 －webViewDidFinishLoad:
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    _progressView.hidden = YES;
    _progressView.progress = 0.0;
    //title
    if (webView.title.length > 0) {
//        self.title = webView.title;//webview的title
        DEBUG_NSLog(@"========>%@",webView.URL.absoluteString);
        if ([webView.URL.absoluteString isEqual:@"http://nlive.159cai.com/live/beidan"]) {
             DEBUG_NSLog(@"webView.title===>%@",webView.title);
            
            
        }
    }
    //取消长按选择框
    [_wkview evaluateJavaScript:@"document.documentElement.style.webkitTouchCallout='none';" completionHandler:nil];
    [_wkview evaluateJavaScript:@"document.documentElement.style.webkitUserSelect='none';"completionHandler:nil];
}

//页面加载失败时调用
// 类似 UIWebView 的- webView:didFailLoadWithError:
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    DEBUG_NSLog(@"页面加载失败时调用%@",error);
    _progressView.hidden = YES;
    _progressView.progress = 0.0;
}

//发生错误时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    DEBUG_NSLog(@"%@^^^^^^^^^",error);
}

//进行页面跳转
//接收到服务器跳转请求之后再执行
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
    
}

#pragma mark - WKUIDelegate
//WKUIDelegate主要是做跟网页交互的，可以消失javascript的一些alert或者action，看起来像自己做的一样
//创建一个新的webview
//可以指定配置对象、导航动作对象、window特性
- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
    return nil;
}

//决定是否允许加载预览视图
- (BOOL)webView:(WKWebView *)webView shouldPreviewElement:(WKPreviewElementInfo *)elementInfo {
    return YES;
}

//webview关闭时回调（9.0中新方法）
- (void)webViewDidClose:(WKWebView *)webView {
    
}

//显示一个js的alert（与js交互）
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    
}

//显示一个确认框（js的）
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler {
    
}

//弹出一个输入框（与js交互的）
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler {
    
}

#pragma mark - WKScriptMessageHandler
//这个协议中包含一个必须实现的方法 这个方法是native和web端交互的关键，它可以直接将接收到的js脚本转为oc或swift对象
//从web界面中接收到一个脚本时调用
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"--------\n%@", message.body);
    
}

#pragma mark -- 监听进度条和title
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        if (object == _wkview) {
            [_progressView setAlpha:1.0f];
            [_progressView setProgress:_wkview.estimatedProgress animated:YES];
            
        } else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - 缓存
- (void)removeCache {
    if ([[[UIDevice currentDevice] systemVersion] intValue ] > 8) {
        NSArray * types = @[WKWebsiteDataTypeMemoryCache, WKWebsiteDataTypeDiskCache];  // 9.0之后才有的
        NSSet *websiteDataTypes = [NSSet setWithArray:types];
        NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
        [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
            
        }];
    } else {
        NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *cookiesFolderPath = [libraryPath stringByAppendingString:@"/Cookies"];
        NSLog(@"%@", cookiesFolderPath);
        NSError *errors;
        [[NSFileManager defaultManager] removeItemAtPath:cookiesFolderPath error:&errors];
    }
}


- (void)initWKWebview {
    
    NSMutableString *javascript = [NSMutableString string];
    [javascript appendString:@"document.documentElement.style.webkitTouchCallout='none';"];//禁止长按
    
    // javascript注入
    WKUserScript *noneSelectScript = [[WKUserScript alloc] initWithSource:javascript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];//通过js与webview内容交互
    [userContentController addScriptMessageHandler:[[WKScriptMessageDelegate alloc] initWithDelegate:self] name:@"message"];
    [userContentController addUserScript:noneSelectScript];
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.userContentController = userContentController;
    configuration.allowsAirPlayForMediaPlayback = YES;//视频播放
    configuration.allowsInlineMediaPlayback = YES;//在线播放
    
    //加载网页或html的方法与UIWebView相同
    _wkview = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)]; //configuration:configuration];
    _wkview.UIDelegate = self;
    _wkview.navigationDelegate = self;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://nlive.159cai.com/live"]];
    [_wkview loadRequest:request];
    [self.view addSubview:_wkview];

}

- (void)initProgressview {
    _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 15)];
    _progressView.alpha = 1.0;
    _progressView.progressTintColor = [UIColor redColor];
    _progressView.trackTintColor = [UIColor redColor];
    _progressView.progress = 0.0;
    _progressView.progressViewStyle = UIProgressViewStyleDefault;
    [self.view addSubview:_progressView];
}

#pragma mark --
- (void)dealloc {
    [_wkview removeObserver:self forKeyPath:@"estimatedProgress"];
//    [_wkview removeObserver:self forKeyPath:@"title"];
    [_wkview.configuration.userContentController removeScriptMessageHandlerForName:@"message"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

//解决控制器不调用dealloc方法，self不被释放的问题
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
