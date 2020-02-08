#import "RuleDetailsVC.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSString+IMAdditions.h"
@interface RuleDetailsVC ()
@property (weak, nonatomic) IBOutlet UIImageView *QuLeHomeDetailImageV;
@property (weak, nonatomic) IBOutlet UITextView *QuLeDetailTextView;
@end
@implementation RuleDetailsVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.QuLeDetailTextView.editable = NO;
    self.QuLeDetailTextView.text = self.conten;
    if (self.url &&[self.url isNull]) {
    [self.QuLeHomeDetailImageV sd_setImageWithURL:[NSURL URLWithString:self.url]
                     placeholderImage:[UIImage imageNamed:@"icon_data_empty"]];
    }
}
@end
