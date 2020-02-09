#import "RuleDetailsVC.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSString+IMAdditions.h"
@interface RuleDetailsVC ()
@property (weak, nonatomic) IBOutlet UIImageView *OrgyHomeDetailImageV;
@property (weak, nonatomic) IBOutlet UITextView *OrgyDetailTextView;
@end
@implementation RuleDetailsVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.OrgyDetailTextView.editable = NO;
    self.OrgyDetailTextView.text = self.conten;
    if (self.url &&[self.url isNull]) {
    [self.OrgyHomeDetailImageV sd_setImageWithURL:[NSURL URLWithString:self.url]
                     placeholderImage:[UIImage imageNamed:@"icon_data_empty"]];
    }
}
@end
