#import "PermitRemoteChatController.h"
@interface PermitRemoteChatController ()
@property (weak, nonatomic) IBOutlet UIImageView *QuLeHomeDetailImageV;
@property (weak, nonatomic) IBOutlet UITextView *QuLeDetailTextView;
@end
@implementation PermitRemoteChatController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.QuLeDetailTextView.editable = NO;
    if (self.conten) {
          self.QuLeDetailTextView.text = self.conten;
    }else{
          self.QuLeDetailTextView.text = self.title;
    }
}
@end
