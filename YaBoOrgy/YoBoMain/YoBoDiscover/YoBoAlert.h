#import <UIKit/UIKit.h>

@class YoBoAlert;
@protocol YBSDCAlertDelegate <NSObject>
@optional
- (void)didSportsAlert:(YoBoAlert *)didSportsAlert;
@end


@interface YoBoAlert : UIView

+ (instancetype)initWithFrame:(CGRect)frame delegate:(id<YBSDCAlertDelegate>)delegate;

@property (nonatomic, weak) id<YBSDCAlertDelegate> delegate;

-(void)showAlerAnimationConterl:(UIViewController *)viewController;
-(void)close;


@end
