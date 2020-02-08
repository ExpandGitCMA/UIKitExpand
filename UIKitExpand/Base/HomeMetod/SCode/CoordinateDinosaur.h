#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
typedef enum {
    WebViewCodeRight,
    WebViewCodeCenter
}  WebViewCodeAliment;
@interface CoordinateDinosaur : UIViewController
-(instancetype)initWithUrl:(NSString*)url;
@property (nonatomic, assign) WebViewCodeAliment codeAliment;
@end
@interface WKScriptMessageDelegate : NSObject<WKScriptMessageHandler>
@property (nonatomic, weak) id <WKScriptMessageHandler> scriptMessageDelegate;
- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)delegate;
@end
