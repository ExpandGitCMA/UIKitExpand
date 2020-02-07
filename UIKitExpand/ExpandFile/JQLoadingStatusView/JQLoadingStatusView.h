#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,ViewStateType) {
    viewStateWithNone = 0, 
    viewStateWithLoading, 
    viewStateWithEmpty,
    viewStateWithLoadError,
    viewStateWithLoadDismess
};
typedef NS_ENUM(NSInteger,ViewStateReturnType) {
    ViewStateReturnReloadViewDataType = 0, 
    ViewStateReturnDidDismessType, 
    ViewStateReturnLoadingDataType,
    ViewStateReturnBackActionType,
};
@protocol StateViewDelegate <NSObject>
@optional
- (void)reloadViewDataStateView; 
- (void)didDismessStateView; 
- (void)loadingDataWithStateView;
- (void)backActionStateView;
@end
typedef void(^StateReturnBlock)(ViewStateReturnType viewStateReturnType);
@interface JQLoadingStatusView : UIView
@property (weak, nonatomic) id<StateViewDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (assign, nonatomic) BOOL backBtnHidden;
@property (assign, nonatomic) BOOL showNavigationBar;
@property (strong, nonatomic) UIColor *navigationBarColor;
@property (strong, nonatomic) NSString *navigationTitle;
@property (strong, nonatomic) UIColor *navigationTitleColor;
@property (strong, nonatomic) UIImage *emptyImage;
@property (strong, nonatomic) UIImage *errorImage;
@property (assign, nonatomic) ViewStateType maskViewStateType;
- (void)setImages:(NSArray *)images duration:(NSTimeInterval)duration;
- (void)showWithInView:(UIView*)view maskViewStateType:(ViewStateType)viewStateType;
- (void)showWithInView:(UIView*)view andFrame:(CGRect)frame maskViewStateType:(ViewStateType)viewStateType;
- (void)showWithViewStateType:(ViewStateType)viewStateType;
- (void)dismessStateView;
- (void)stateReturnBlock:(StateReturnBlock)stateReturnBlock;
@end
