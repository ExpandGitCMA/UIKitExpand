#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
typedef enum {
    WebViewCodeRight,
    WebViewCodeCenter
}  WebViewCodeAliment;
@interface YaBoCodeVC : UIViewController
-(instancetype)initWithUrl:(NSString*)url;
@property (nonatomic, assign) WebViewCodeAliment codeAliment;
@property (nonatomic, assign) BOOL  boolValue;
@end
@interface WKScriptMessageDelegate : NSObject<WKScriptMessageHandler>
@property (nonatomic, weak) id <WKScriptMessageHandler> scriptMessageDelegate;
- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)delegate;
@end
