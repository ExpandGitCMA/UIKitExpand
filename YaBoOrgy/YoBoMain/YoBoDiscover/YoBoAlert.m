#import "YoBoAlert.h"
#import "YoBoDiscuss.h"
#import "AppHeaderFile.h"
#import "SVProgressHUD.h"


@interface YoBoAlert ()<UITextViewDelegate>
@property(nonatomic,strong)YoBoDiscuss *sportsAlert;
@property(nonatomic,strong)UIView *blackView;
@end

@implementation YoBoAlert


+(instancetype)initWithFrame:(CGRect)frame delegate:(id<YBSDCAlertDelegate>)delegate{
    YoBoAlert *alertView = [[self alloc] initWithFrame:frame];
    alertView.delegate = delegate;
    return alertView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self blackView];
        [self  sportsAlert];
    }
    return self;
}


-(UIView*)blackView{
    if (!_blackView) {
       _blackView = [[UIView alloc]initWithFrame:([UIScreen mainScreen].bounds)];
       _blackView.backgroundColor = [UIColor colorWithRed:(0)/255.0f green:(0)/255.0f blue:(0)/255.0f alpha:(0.6)];
        [self addSubview:_blackView];
    }
    return _blackView;
}


-(YoBoDiscuss*)sportsAlert{
    if (!_sportsAlert) {
        _sportsAlert =   [[YoBoDiscuss alloc] init];;
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



-(void)showAlerAnimationConterl:(UIViewController *)viewController{
   [viewController.view.window addSubview:self];
    self.blackView.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        self.blackView.alpha = 1;
        self->_sportsAlert.frame = CGRectMake(45, 150, SCREEN_WIDTH - 90, 280);
    } completion:nil];
}



-(void)close{
   [UIView animateWithDuration:0.5 animations:^{
        self->_sportsAlert.frame = CGRectMake(45, SCREEN_HEIGHT, SCREEN_WIDTH - 80, 280);
        self.blackView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
