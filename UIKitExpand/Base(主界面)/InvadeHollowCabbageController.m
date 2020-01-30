#import "InvadeHollowCabbageController.h"
@interface InvadeHollowCabbageController ()
@end
@implementation InvadeHollowCabbageController
- (void)viewDidLoad {
    [super viewDidLoad];
  [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(setClick) title:@"nav_set"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)setClick{
}
@end
