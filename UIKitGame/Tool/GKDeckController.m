#import "GKDeckController.h"
@interface GKDeckController ()
@end
@implementation GKDeckController
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES ;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (BOOL)shouldAutorotate{
    return self.topPresentedController.shouldAutorotate;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return self.topPresentedController.supportedInterfaceOrientations;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return self.topPresentedController.preferredInterfaceOrientationForPresentation;
}
- (BOOL)prefersStatusBarHidden {
    return self.topPresentedController.prefersStatusBarHidden;
}
@end
