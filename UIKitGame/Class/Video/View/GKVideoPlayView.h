#import <UIKit/UIKit.h>
#import "GKSlider.h"
#import "GKVideoItem.h"
@class GKVideoPlayView;
@protocol GKVideoPlayViewDelegate <NSObject>
- (void)playView:(GKVideoPlayView *)playView pause:(BOOL)pause;
- (void)playView:(GKVideoPlayView *)playView screen:(BOOL)screen;
- (void)playView:(GKVideoPlayView *)playView goBack:(BOOL)goBack;
- (void)playView:(GKVideoPlayView *)playView time:(NSTimeInterval)time;
- (void)playView:(GKVideoPlayView *)playView item:(GKVideoStreams*)item time:(NSTimeInterval)time;
@end
@interface GKVideoPlayView : UIView
@property (weak, nonatomic) IBOutlet GKSlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *minLab;
@property (weak, nonatomic) IBOutlet UILabel *maxLab;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *screenBtn;
@property (weak, nonatomic) IBOutlet UIButton *clarityBtn;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (assign, nonatomic) id<GKVideoPlayViewDelegate>delegate;
@property (assign, nonatomic) CGFloat cache;
- (void)setCurrent:(NSTimeInterval)current duration:(NSTimeInterval)duration;
- (void)setItems:(NSArray *)items cutrrent:(GKVideoStreams *)item;
@end
