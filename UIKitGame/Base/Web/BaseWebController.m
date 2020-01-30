#import "BaseWebController.h"
@interface BaseWebController ()
@end
@implementation BaseWebController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNav];
    [self createContentView];
}
#pragma mark - 控件初始化
-(ProgressWKWebView *)webView
{
    if (_webView == nil) {
        _webView = [[ProgressWKWebView alloc] init];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.delegate = self;
        [_webView setProgressTintColor:AppColor TrackColor:[UIColor colorWithRGB:0xffeecc]];
    }
    return _webView;
}
#pragma mark - 界面初始化
-(void)createNav
{
}
-(void)createContentView
{
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.webView.superview);
    }];
}
#pragma mark - 外部接口
- (void)loadRequest:(NSURLRequest *)request
{
    [self.webView loadRequest:request];
}
- (void)loadURL:(NSURL *)URL {
    [self.webView loadRequest:[NSURLRequest requestWithURL:URL]];
}
- (void)loadURLString:(NSString *)URLString {
    if(!URLString.length)
    {
        return;
    }
   [self isNeedGetTicketWithUrlStr:URLString];
}
- (void)loadHTMLString:(NSString *)HTMLString{
    [self loadHTMLString:HTMLString baseURL:nil];
}
- (void)loadHTMLString:(NSString *)HTMLString baseURL:(NSURL *)baseURL{
    [self.webView.wkWebView loadHTMLString:HTMLString baseURL:baseURL];
}
- (void)loadFileURL:(NSURL *)loadFileURL allowingReadAccessToURL:(NSURL *)allowingReadAccessToURL{
    [self.webView.wkWebView loadFileURL:loadFileURL allowingReadAccessToURL:allowingReadAccessToURL];
}
-(void)isNeedGetTicketWithUrlStr:(NSString *)urlStr
{
    NSURL *URL = [NSURL URLWithString:urlStr];
    [self.webView loadURL:URL];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)dealloc
{
}
@end
