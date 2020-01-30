#import "BaseNavigationController.h"
@interface BaseNavigationController ()<UINavigationControllerDelegate>
@property (nonatomic, getter=isPushing) BOOL pushing;
@end
@implementation BaseNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
    NSArray *array = [NSArray arrayWithObjects:[self class], nil]; 
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:array];
    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
    attribute[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attribute[NSFontAttributeName] = [UIFont systemFontOfSize:18 weight:UIFontWeightHeavy];
    navBar.titleTextAttributes = attribute;
    UIImage *backgroundImage = [UIImage imageWithColor:AppColor];
    [navBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    [navBar setShadowImage:[UIImage new]];
}
#pragma mark UINavigationControllerDelegate
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.pushing == YES) {
        NSLog(@"被拦截");
        return;
    } else {
        NSLog(@"push");
        self.pushing = YES;
    }
    [super pushViewController:viewController animated:animated];
}
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.pushing = NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (BOOL)shouldAutorotate{
    return self.visibleViewController.shouldAutorotate;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return self.visibleViewController.supportedInterfaceOrientations;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return self.visibleViewController.preferredInterfaceOrientationForPresentation;
}
- (BOOL)prefersStatusBarHidden {
    return [self.visibleViewController prefersStatusBarHidden];
}
@end
