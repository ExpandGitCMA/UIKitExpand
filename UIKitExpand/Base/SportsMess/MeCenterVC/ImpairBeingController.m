#import "ImpairBeingController.h"
#import "UncertainTransfusion.h"
@interface ImpairBeingController ()
@end
@implementation ImpairBeingController
- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    NSString  *seteid = [[UncertainTransfusion sharedDefaultManager]getApresentTimer];
    
    switch ([seteid integerValue]) {
        case 1:{
            self.title = @"《亞博体育-球圈隐私政策》";
        }
         break;
        case 2:{
            self.title = @"《亞博体育-足球隐私政策》";
        }break;
        default:
            break;
    }
}
@end
