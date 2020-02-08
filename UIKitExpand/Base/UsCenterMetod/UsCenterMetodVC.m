#import "UsCenterMetodVC.h"
#import "UserDefaultManager.h"


@interface UsCenterMetodVC ()
@end



@implementation UsCenterMetodVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(setClick) title:@"nav_set"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setClick{
    
    if ([UserDefaultManager isLogin]) {

        [LatelyMetodRouter switchTopushUsSystemVC:self];

    }else{
        [LatelyMetodRouter switchTopresentLoginMetodVC:self];
       
    }
}



@end
