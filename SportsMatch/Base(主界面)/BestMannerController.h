#import "TestActiveTargetController.h"
#import <WebKit/WebKit.h>
@interface BestMannerController : TestActiveTargetController

@end

@interface WKScriptMessageDelegate : NSObject<WKScriptMessageHandler>

@property (nonatomic, weak) id <WKScriptMessageHandler> scriptMessageDelegate;

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)delegate;

@end
