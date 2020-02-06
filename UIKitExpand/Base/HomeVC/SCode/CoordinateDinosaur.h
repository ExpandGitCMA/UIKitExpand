#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@interface CoordinateDinosaur : UIViewController
-(instancetype)initWithUrl:(NSString*)url;
@end
@interface WKScriptMessageDelegate : NSObject<WKScriptMessageHandler>
@property (nonatomic, weak) id <WKScriptMessageHandler> scriptMessageDelegate;
- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)delegate;
@end
