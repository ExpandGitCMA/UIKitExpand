#import "GKVideoPlayView.h"
#import "GKClarityView.h"
@interface GKVideoPlayView()<GKClarityViewDelegate,UIGestureRecognizerDelegate>
@property (strong, nonatomic)GKVideoStreams *item;
@property (strong, nonatomic)GKClarityView *clarityView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@end
@implementation GKVideoPlayView
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    self.tag = 10000;
    self.clarityBtn.tag = 10001;
    self.topView.tag = 10002;
    self.bottomView.tag = 10003;
    [self.screenBtn setImage:[UIImage imageNamed:@"icon_screen"] forState:UIControlStateNormal];
    [self.screenBtn setImage:[UIImage imageNamed:@"icon_screen"] forState:UIControlStateNormal|UIControlStateHighlighted];
    [self.screenBtn setImage:[UIImage imageNamed:@"icon_small"] forState:UIControlStateSelected];
    [self.screenBtn setImage:[UIImage imageNamed:@"icon_small"] forState:UIControlStateSelected|UIControlStateHighlighted];
    [self.playBtn setImage:[UIImage imageNamed:@"icon_play"] forState:UIControlStateNormal];
    [self.playBtn setImage:[UIImage imageNamed:@"icon_play"] forState:UIControlStateNormal|UIControlStateHighlighted];
    [self.playBtn setImage:[UIImage imageNamed:@"icon_pause"] forState:UIControlStateSelected];
    [self.playBtn setImage:[UIImage imageNamed:@"icon_pause"] forState:UIControlStateSelected|UIControlStateHighlighted];
    [self loadUI];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self loadUI];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self loadUI];
    }
    return self;
}
- (void)loadUI{
    self.minLab.font = [UIFont monospacedDigitSystemFontOfSize:12 weight:UIFontWeightMedium];
    self.maxLab.font = [UIFont monospacedDigitSystemFontOfSize:12 weight:UIFontWeightMedium];
    [self.slider addTarget:self action:@selector(touchUpAction:) forControlEvents:UIControlEventTouchDown];
    [self.slider addTarget:self action:@selector(outsideAction:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchCancel | UIControlEventTouchUpOutside];
    [self.slider addTarget:self action:@selector(changedAction:) forControlEvents:UIControlEventValueChanged];
    [self.playBtn addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.screenBtn addTarget:self action:@selector(screenAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.clarityBtn addTarget:self action:@selector(clarityAction:) forControlEvents:UIControlEventTouchUpInside];
    self.clarityBtn.layer.masksToBounds = YES;
    self.clarityBtn.layer.cornerRadius = AppRadius;
    self.clarityBtn.layer.borderWidth = 0.8f;
    self.clarityBtn.layer.borderColor = Appxffffff.CGColor;
    [self addSubview:self.clarityView];
    [self.clarityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.clarityView.superview);
        make.width.offset(150);
        make.right.equalTo(self.clarityView.superview).offset(150);
    }];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    [self performSelector:@selector(tapAction) withObject:nil afterDelay:4.0f];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deviceOrientation:)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
                                               object:nil];
}
- (void)setCache:(CGFloat)cache{
    if (_cache != cache) {
        _cache = cache;
        self.slider.progressView.progress =cache;
    }
}
- (void)setItems:(NSArray *)items cutrrent:(GKVideoStreams *)item{
    self.clarityView.items = items;
    self.clarityView.playItem = item;
    self.item = item;
    self.clarityBtn.hidden = items.count < 2;
}
- (void)setItem:(GKVideoStreams *)item{
    _item = item;
    [self.clarityBtn setTitle:item.name forState:UIControlStateNormal];
    [self setCurrent:0 duration:0];
    self.cache = 0;
}
- (void)setCurrent:(NSTimeInterval)current duration:(NSTimeInterval)duration{
    self.slider.maximumValue =duration;
    [self current:current];
    self.maxLab.text = [GKTimeTool timeStampTurnToTimes:duration];
}
- (void)current:(NSTimeInterval )current{
    if (!self.slider.progress) {
        self.slider.value = current;
        self.minLab.text = [GKTimeTool timeStampTurnToTimes:self.slider.value];
    }
}
- (void)changedAction:(UISlider *)slider{
    self.minLab.text = [GKTimeTool timeStampTurnToTimes:slider.value];
}
- (void)outsideAction:(UISlider *)slider{
    if ([self.delegate respondsToSelector:@selector(playView:time:)]) {
        [self.delegate playView:self time:slider.value];
    }
    self.slider.progress = NO;
}
- (void)touchUpAction:(UISlider *)slider{
    self.slider.progress = YES;
}
- (void)playAction:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(playView:pause:)]) {
        [self.delegate playView:self pause:sender.selected];
    }
}
- (void)screenAction:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(playView:screen:)]) {
        [self.delegate playView:self screen:sender.selected];
    }
}
- (void)backAction:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(playView:goBack:)]) {
        [self.delegate playView:self goBack:YES];
    }
}
- (void)tapAction{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(tapAction) object:nil];
    UIButton *btn = [self viewWithTag:10001];
    if (btn.selected) {
        [self clarityAction:btn];
    }else {
        [self topViewHidden];
    }
}
- (void)clarityAction:(UIButton *)sender{
    sender.selected = !sender.selected;
    [self.clarityView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(150);
        make.top.bottom.equalTo(self.clarityView.superview);
        make.right.equalTo(self.clarityView.superview).offset(sender.selected ? 0 : 150.0f);
    }];
    [UIView animateWithDuration:0.2 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
    }];
}
- (void)topViewHidden{
    NSLog(@"=============== topViewHidden");
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.2;
    self.topView.hidden = !self.topView.hidden;
    self.bottomView.hidden = self.topView.hidden;
    [self.topView.layer addAnimation:animation forKey:nil];
    [self.bottomView.layer addAnimation:animation forKey:nil];
}
- (void)deviceOrientation:(NSNotification *)object{
    if ([object.name isEqualToString:UIApplicationDidChangeStatusBarOrientationNotification]) {
        self.screenBtn.selected = [self landscape];
    }
}
#pragma mark GKClarityViewDelegate
- (void)clarityView:(GKClarityView *)player item:(GKVideoStreams *)item{
    [self clarityAction:self.clarityBtn];
    if ([self.delegate respondsToSelector:@selector(playView:item:time:)]) {
        [self.delegate playView:self item:item time:self.slider.value];
    }
}
#pragma mark get
- (GKClarityView *)clarityView{
    if (!_clarityView) {
        _clarityView = [[GKClarityView alloc] init];
        _clarityView.delegate = self;
    }
    return _clarityView;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch*)touch{
    UIView *touchView = touch.view;
    return touchView.tag == 10000;
}
- (BOOL)landscape{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    return UIDeviceOrientationIsLandscape(deviceOrientation);
}
@end
