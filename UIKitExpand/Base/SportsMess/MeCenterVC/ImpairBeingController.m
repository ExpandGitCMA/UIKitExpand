#import "ImpairBeingController.h"
#import "UncertainTransfusion.h"
@interface ImpairBeingController ()
@end
@implementation ImpairBeingController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString  *seteid = [[UncertainTransfusion sharedDefaultManager]getApresentTimer];
    self.title = @"《亞博体育-狂欢隐私政策》";
 
}
@end
