#import "PermitRemoteChatController.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface PermitRemoteChatController ()
@property (weak, nonatomic) IBOutlet UIImageView *QuLeHomeDetailImageV;
@property (weak, nonatomic) IBOutlet UITextView *QuLeDetailTextView;
@end
@implementation PermitRemoteChatController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.QuLeDetailTextView.editable = NO;
    self.QuLeDetailTextView.text = self.conten;
    if (self.url) {
        
    [self.QuLeHomeDetailImageV sd_setImageWithURL:[NSURL URLWithString:self.url]
                     placeholderImage:[UIImage imageNamed:@"icon_data_empty"]];
    }
    
}
@end
