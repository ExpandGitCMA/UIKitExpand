#import "BaseViewController.h"
#import "ProgressWKWebView.h"
@interface BaseWebController : BaseViewController<ProgressWKDelegate>
@property (nonatomic,strong)ProgressWKWebView *webView;
- (void)loadURLString:(NSString *)URLString;
- (void)loadHTMLString:(NSString *)HTMLString;
- (void)loadHTMLString:(NSString *)HTMLString baseURL:(NSURL *)baseURL;
- (void)loadFileURL:(NSURL *)loadFileURL allowingReadAccessToURL:(NSURL *)allowingReadAccessToURL;
@end
