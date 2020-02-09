#import "CommunityVC.h"
#import "UserDefaultManager.h"


@interface CommunityVC ()

@end


@implementation CommunityVC
- (void)viewDidLoad {
    [super viewDidLoad];
       [self.navigationController captureNavigationType:NavigationBarImageStyle NavigationStyle:NavRightStyle barTarget:self action:@selector(editClick) title:@"edit_icon"];
    
}

//PostedMetodVC
-(void)editClick{
    
    if ([UserDefaultManager isLogin]) {
        [LatelyMetodRouter switchTopushPostedMetodVC:self];
    }else{
         [LatelyMetodRouter switchTopresentLoginMetodVC:self];
    }
  
    
    
}

@end
