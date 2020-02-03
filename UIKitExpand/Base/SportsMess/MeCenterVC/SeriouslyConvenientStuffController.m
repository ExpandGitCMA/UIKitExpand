#import "SeriouslyConvenientStuffController.h"
#import "UncertainTransfusion.h"
@interface SeriouslyConvenientStuffController ()
@property (weak, nonatomic) IBOutlet UILabel *titel;
@property (weak, nonatomic) IBOutlet UILabel *link;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@end
@implementation SeriouslyConvenientStuffController
- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"关于我们";
    NSString  *seteid = [[UncertainTransfusion sharedDefaultManager]getApresentTimer];
    switch ([seteid integerValue]) {
        case 2:{
            _image.image = [UIImage imageNamed:@"logo.jpg"];
            _titel.text = @"亞博体育-狂欢,关注体育资讯和赛事焦点,推广足球体育知识,推广健康乐活的运动型生活方式。";
            _link.text = @"联系我们:NO25669584@123.com";
        }
         break;
        default:
            break;
    }
}
@end
