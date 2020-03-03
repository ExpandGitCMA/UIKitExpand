#import "YBSYBSportsAlert.h"
#import "YBSUIPrivacyView.h"
#import "AppUrlprotocol.h"
#import "SVProgressHUD.h"
@interface YBSYBSportsAlert ()<UITextViewDelegate>
@property(nonatomic,strong)YBSUIPrivacyView *sportsAlert;
@property(nonatomic,strong)UIView *sportsBlackView;
@end
@implementation YBSYBSportsAlert
+(instancetype)initYBSportsAlertWithFrame:(CGRect)frame delegate:(id<YBSDCAlertDelegate>)delegate{
    YBSYBSportsAlert *alertView = [[self alloc] initWithFrame:frame];
    alertView.delegate = delegate;
    return alertView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self sportsBlackView];
        [self  sportsAlert];
    }
    return self;
}

-(UIView*)sportsBlackView{
    if (!_sportsBlackView) {
       _sportsBlackView = [[UIView alloc]initWithFrame:([UIScreen mainScreen].bounds)];
       _sportsBlackView.backgroundColor = [UIColor colorWithRed:(0)/255.0f green:(0)/255.0f blue:(0)/255.0f alpha:(0.6)];
        
        [self addSubview:_sportsBlackView];
    }
    return _sportsBlackView;
}
-(YBSUIPrivacyView*)sportsAlert{
    if (!_sportsAlert) {
        _sportsAlert =   [[YBSUIPrivacyView alloc] init];;
         _sportsAlert.frame = CGRectMake(45, SCREEN_HEIGHT, SCREEN_WIDTH - 90, 280);
         _sportsAlert.userInteractionEnabled = YES;
         _sportsAlert.layer.cornerRadius = 14;
         _sportsAlert.layer.masksToBounds=YES;
         _sportsAlert.layer.borderColor = [UIColor grayColor].CGColor;
        _sportsAlert.layer.borderWidth= 0;
         _sportsAlert.backgroundColor = [UIColor whiteColor];
        
        [ _sportsAlert.agree addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
         [ _sportsAlert.check addTarget:self action:@selector(privacy:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_sportsAlert];
    }
    return _sportsAlert;
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{ return NO; }
-(void)clicked:(UIButton *)sender{

  

    if (_sportsAlert.OrgyTalkTextView.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请输入评论话题！！"];
        return;
    }
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showSuccessWithStatus:@"评论成功，我们将在2个小时内审核您的评论"];
        [self close];
    });
}

-(void)privacy:(UIButton *)sender{
   [self close];
}
-(void)setAnimationType:(YBSDCAlerAnimation)animationType{
      _animationType = animationType;
}
-(void)YBSDCAlerAnimationConterl:(UIViewController *)viewController{
   [viewController.view.window addSubview:self];
    self.sportsBlackView.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        self.sportsBlackView.alpha = 1;
        self->_sportsAlert.frame = CGRectMake(45, 150, SCREEN_WIDTH - 90, 280);
    } completion:nil];
}
-(void)close{
    switch (_animationType) {
        case YBSportsAlertAnimationTypeDefault:{
            [UIView animateWithDuration:0.5 animations:^{
                self->_sportsAlert.frame = CGRectMake(45, SCREEN_HEIGHT, SCREEN_WIDTH - 80, 280);
                self.sportsBlackView.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
        
        default:
            break;
    }
}
@end
