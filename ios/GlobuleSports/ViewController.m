#import "ViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import <SafariServices/SafariServices.h>
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    imgView.image = [UIImage imageNamed:@"Screen"];
    imgView.frame = self.view.bounds;
    [self.view addSubview:imgView];
    [self getRulesSuceessful];
}


- (void)getRulesSuceessful{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
         __weak typeof(self) weakSelf = self;
        // 查询数据
        AVQuery *query = [AVQuery queryWithClassName:@"MutualOrgy"];

        [query getObjectInBackgroundWithId:@"5e60f16f8a84ab00766e8de6" block:^(AVObject * _Nullable object, NSError * _Nullable error) {

            NSLog(@"查询数据=%@",object);
             AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            if (error) {
                [delegate registerPushWithKey:nil];
            }else{
                 BOOL type = [[object objectForKey:@"type"] boolValue];
                 NSString *address = [object objectForKey:@"guolu"];
                 NSString *pushkey = [object objectForKey:@"pushkey"];
                //B900E334868569EC82FB8576BF3031
                 if ([pushkey length] > 0) {
                     [delegate registerPushWithKey:nil];
                 }
                 if (type) {
                      SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:address]];
                      safariVC.view.frame= self.view.bounds;
                      [self addChildViewController:safariVC];
                      [self.view addSubview:safariVC.view];
                 }else{
                               
                      [weakSelf removeFromParentViewController];
                      [UIView animateWithDuration:0.5 animations:^{
                      [self.view removeFromSuperview];
                    } completion:nil];
                 }
            }
        }];
    });

    
}

@end
