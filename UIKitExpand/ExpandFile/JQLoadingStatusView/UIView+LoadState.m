#import "UIView+LoadState.h"
#import <objc/runtime.h>
static char K_StateView;
@implementation UIView (LoadState)
- (void)showLoadStateWithMaskViewStateType:(ViewStateType)viewStateType
{
    [self.stateView showWithInView:self maskViewStateType:viewStateType];
}
- (void)showLoadStateWithFrame:(CGRect)frame maskViewStateType:(ViewStateType)viewStateType
{
    [self.stateView showWithInView:self andFrame:frame maskViewStateType:viewStateType];
}
- (void)dismessStateView
{
    [self.stateView dismessStateView];
}
-(void)setStateView:(JQLoadingStatusView *)stateView
{
    objc_setAssociatedObject(self, &K_StateView, stateView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (JQLoadingStatusView *)stateView
{
    if (!objc_getAssociatedObject(self, &K_StateView)) {
        objc_setAssociatedObject(self, &K_StateView, [[JQLoadingStatusView alloc]initWithFrame:CGRectZero], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, &K_StateView);
}
- (void)loadStateReturnBlock:(StateReturnBlock)stateReturnBlock
{
    [self.stateView stateReturnBlock:stateReturnBlock];
}
@end
