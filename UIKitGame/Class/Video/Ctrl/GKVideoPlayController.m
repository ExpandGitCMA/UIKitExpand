#import "GKVideoPlayController.h"
#import "UIViewController+Tool.h"
#import "AppDelegate.h"
#import "GKVideoPlayer.h"
#import "GKVideoPlayView.h"
#import "GKDownModel.h"
#import "GKDownCell.h"
#import "GKVideoPlayCell.h"
#import "GKPlayDataQueue.h"
#import "GKVideoPlayHeaderView.h"
#import "GKAVPlayer.h"
#import "GKDownDataQueue.h"
@interface GKVideoPlayController ()<GKVideoPlayerDelegate,GKVideoPlayViewDelegate>
@property (copy, nonatomic) NSString *vid;
@property (strong, nonatomic) GKVideoModel *model;
@property (strong, nonatomic) GKVideoPlayView *contentView;
@property (strong, nonatomic) GKAVPlayer *player;
@property (strong, nonatomic) UIView *playView;
@property (strong, nonatomic) NSMutableArray *listData;
@property (assign, nonatomic) BOOL landscape;
@property (assign, nonatomic) BOOL wifi;
@end
@implementation GKVideoPlayController
- (void)dealloc{
    self.player.delegate = nil;
    self.contentView.delegate = nil;
}
+ (instancetype)vcWithPlayModel:(GKVideoModel *)model;{
    GKVideoPlayController *vc =[[GKVideoPlayController alloc] init];
    vc.model = model;
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    [self loadUI];
    [self loadData];
}
- (void)loadUI{
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.playView];
    [self.playView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.playView.superview).offset(STATUS_BAR_HIGHT);
        make.left.right.equalTo(self.playView.superview);
        make.height.offset(SCREEN_WIDTH/16*9.0f);
    }];
    [self.playView addSubview:self.player.contentView];
    [self.player.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.player.contentView.superview);
    }];
    [self.playView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView.superview);
    }];
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.tableView.superview);
        make.top.equalTo(self.playView.mas_bottom).offset(0);
    }];
    [self.tableView registerClass:GKVideoPlayHeaderView.class forHeaderFooterViewReuseIdentifier:NSStringFromClass(GKVideoPlayHeaderView.class)];
    [self setupEmpty:self.tableView];
    [self setupRefresh:self.tableView option:ATFooterRefresh|ATFooterAutoRefresh];
}
- (void)loadData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [GKPlayDataQueue getDataFromDataBase:self.model.videoId completion:^(GKVideoModel *model) {
            if (model) {
                 self.model.playTime = model.playTime;
                if (model.playTime + 6 > self.model.duration.integerValue) {
                     self.model.playTime = 0;
                }
                self.model.selectStreams = model.selectStreams;
            }
            [self playSet];
            [self playSelect];
        }];
    });
}
- (void)refreshData:(NSInteger)page{
    [self endRefresh:NO];
}
- (void)playSet{
    if (!self.wifi) {
        [self.playView showMessage:@"当前正使用手机流量播放"];
    }
    NSString *title = [NSString stringWithFormat:@"正在播放:%@",self.model.title];
    [self.playView showMessage:title];
    [self playItem];
    [self.tableView reloadData];
}
- (void)playItem{
    [self show];
    GKVideoStreams *item = self.model.selectStreams;
    [self.player playUrl:item.url];
    [self.contentView setItems:self.model.streams cutrrent:item];
}
- (void)playSelect{
    NSTimeInterval time = self.model.playTime;
    if (time > 6) {
        NSString *title = [NSString stringWithFormat:@"继续上次观看:%@",[GKTimeTool timeStampTurnToTimes:time]];
        [self.playView showMessage:title];
        [self.player seek:time];
    }
}
#pragma mark GKVideoPlayerDelegate
- (void)player:(GKVideoPlayer *)player cache:(CGFloat)cache{
    self.contentView.cache = cache;
}
- (void)player:(GKVideoPlayer *)player state:(GKVideoPlayState)state{
    switch (state) {
        case GKVideoPlayReady:{
            if (player.playing) {
                self.contentView.playBtn.selected = NO;
            }
            [self dismiss];
        }break;
        case GKVideoPlayPlaying:
            if (player.playing) {
                self.contentView.playBtn.selected = NO;
            }
            break;
        case GKVideoPlayPaused:
        case GKVideoPlayFinish:
            if (!player.playing) {
                self.contentView.playBtn.selected = YES;
            }
            break;
        default:
            break;
    }
}
- (void)player:(GKVideoPlayer *)player progress:(NSTimeInterval)progress{
    [self.contentView setCurrent:progress duration:player.duration];
}
#pragma mark GKVideoPlayViewDelegate
- (void)playView:(GKVideoPlayView *)playView pause:(BOOL)pause{
    self.player.playing ? [self.player pause] : [self.player resume];
}
- (void)playView:(GKVideoPlayView *)playView screen:(BOOL)screen{
    [self screenAction];
}
- (void)playView:(GKVideoPlayView *)playView goBack:(BOOL)goBack{
    [self goBack];
}
- (void)playView:(GKVideoPlayView *)playView time:(NSTimeInterval)time{
    [self.player seek:time];
}
- (void)playView:(GKVideoPlayView *)playView item:(GKVideoStreams*)item time:(NSTimeInterval)time{
    self.model.selectStreams = item;
    [self inseartDataQueue];
    [self playItem];
}
- (void)screenAction{
    UIInterfaceOrientation orientation = (self.landscape) ? UIInterfaceOrientationPortrait: UIInterfaceOrientationLandscapeRight;
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.makeOrientation = orientation;
    [self setOrientations:orientation];
    [self setNeedsStatusBarAppearanceUpdate];
}
- (void)layoutPlayView{
    self.fd_interactivePopDisabled = self.landscape;
    if (self.landscape) {
        [UIView animateWithDuration:0.25 animations:^{
            self.playView.transform = CGAffineTransformMakeRotation(M_PI/2);
            [self.playView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.width.offset(SCREEN_HEIGHT);
                make.height.offset(SCREEN_WIDTH);
                make.centerX.equalTo(self.view.mas_centerX);
                make.centerY.equalTo(self.view.mas_centerY);
            }];
        }];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            self.playView.transform = CGAffineTransformIdentity;
            [self.playView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.playView.superview).offset(STATUS_BAR_HIGHT);
                make.left.right.equalTo(self.playView.superview);
                make.height.offset(SCREEN_WIDTH/16*9.0f);
            }];
        }];
    }
}
- (void)goBack{
    [self inseartDataQueue];
    self.landscape ? [self screenAction] : [super goBack];
}
- (void)show{
    [MBProgressHUD hideHUDForView:self.playView animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.playView animated:YES];
    hud.contentColor = [UIColor whiteColor];
    hud.userInteractionEnabled = YES;
    hud.bezelView.color = [UIColor blackColor];
    hud.minSize = CGSizeMake(30, 30);
}
- (void)dismiss{
     [MBProgressHUD hideHUDForView:self.playView animated:YES];
}
- (void)inseartDataQueue{
    if (!self.landscape && self.player.current > 6) {
        self.model.playTime = self.player.current;
        [GKPlayDataQueue insertDataToDataBase:self.model completion:nil];
    }
}
#pragma mark get
- (UIView *)playView{
    if (!_playView) {
        _playView = [[UIView alloc] init];
        _playView.backgroundColor = [UIColor blackColor];
    }
    return _playView;
}
- (GKVideoPlayView *)contentView{
    if (!_contentView) {
        _contentView = [GKVideoPlayView instanceView];
        _contentView.delegate = self;
    }
    return _contentView;
}
- (GKAVPlayer *)player{
    if (!_player) {
        _player = [[GKAVPlayer alloc] init];
        _player.delegate = self;
    }
    return _player;
}
- (BOOL)wifi{
    return [YYReachability reachability].status == YYReachabilityStatusWiFi;
}
- (BOOL)landscape{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    return UIDeviceOrientationIsLandscape(deviceOrientation);
}
#pragma mark base
- (BOOL)shouldAutorotate{
    return YES;
}
- (BOOL)prefersStatusBarHidden {
    return self.landscape;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
     self.fd_interactivePopDisabled = self.landscape;
    if (size.width > size.height) {
        [self.playView mas_remakeConstraints:^(MASConstraintMaker *make) {
           make.edges.equalTo(self.playView.superview);
        }];
    }else{
        [self.playView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.playView.superview).offset(STATUS_BAR_HIGHT);
            make.left.right.equalTo(self.playView.superview);
            make.height.offset(SCREEN_WIDTH/16*9.0f);
        }];
    }
}
@end
