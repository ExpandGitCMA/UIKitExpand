#import "YaBoRemoteVC.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSString+IMAdditions.h"
@interface YaBoRemoteVC ()
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end
@implementation YaBoRemoteVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.editable = NO;
    self.textView.text = self.conten;
    if (self.url &&[self.url isNull]) {
   [self.detailImage sd_setImageWithURL:[NSURL URLWithString:self.url]
                  placeholderImage:[UIImage imageNamed:@"icon_data_empty"]];
    }
    if (self.image &&[self.image isNull]) {
        [self.detailImage setImage:[UIImage imageNamed:self.image]];
    }
}
@end
