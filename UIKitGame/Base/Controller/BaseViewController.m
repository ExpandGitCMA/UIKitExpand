#import "BaseViewController.h"
@interface BaseViewController ()<UIGestureRecognizerDelegate>
@end
@implementation BaseViewController
- (void)dealloc{
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"%@", self.class);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = Appxffffff;
    self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
    self.fd_interactivePopDisabled = NO;
    self.fd_prefersNavigationBarHidden = NO;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self setKeyBoardDismiss];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
#pragma mark UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES ;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (BOOL)shouldAutorotate {
    return YES;
}
- (BOOL)prefersStatusBarHidden {
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}
@end
