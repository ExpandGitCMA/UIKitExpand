#import "YBSRootViewController.h"
@interface YBSRootViewController ()
{
    CGRect _settingFrame;
    CGRect _languageFrame;
    CGRect _moreFrame;
    CGRect _rankFrame;
    CGRect _playFrame;
    CGRect _getFrame;
    BOOL _isNotFristLoad;
}
@end
@implementation YBSRootViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (IBAction)home:(UIButton *)sender {
     [self performSegueWithIdentifier:@"Rare" sender:nil];
}
- (IBAction)play:(UIButton *)sender {
       [self performSegueWithIdentifier:@"PlayGame" sender:nil];
}
- (IBAction)set:(UIButton *)sender {
    [self performSegueWithIdentifier:@"Setting" sender:nil];
}
- (void)loadHomeButtonFrame {
    NSString *framePath = [[NSBundle mainBundle] pathForResource:@"home.plist" ofType:nil];
    NSDictionary *frameDic = [NSDictionary dictionaryWithContentsOfFile:framePath];
    NSDictionary *dict;
    if (iPhone5) {
        dict = frameDic[@"iphone5"];
    } else {
        dict = frameDic[@"iphone4"];
    }
    _settingFrame = CGRectFromString(dict[@"btn_setting_frame"]);
    _languageFrame = CGRectFromString(dict[@"btn_language_frame"]);
    _moreFrame = CGRectFromString(dict[@"btn_more_frame"]);
    _rankFrame = CGRectFromString(dict[@"btn_rank_frame"]);
    _playFrame = CGRectFromString(dict[@"btn_play_frame"]);
    _getFrame = CGRectFromString(dict[@"btn_get_frame"]);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
}
@end
