#import <UIKit/UIKit.h>
#import "JQLoadingStatusView.h"
@interface UIView (LoadState)
@property (strong, nonatomic) JQLoadingStatusView *stateView;
- (void)showLoadStateWithMaskViewStateType:(ViewStateType)viewStateType;
- (void)showLoadStateWithFrame:(CGRect)frame maskViewStateType:(ViewStateType)viewStateType;
- (void)dismessStateView;
- (void)loadStateReturnBlock:(StateReturnBlock)stateReturnBlock;
@end
