#import <UIKit/UIKit.h>
@interface UIView (GKToast)
- (void)showMessage:(NSString *)message;
- (void)showMessage:(NSString *)message
duration:(NSTimeInterval)duration
           position:(id)position;
- (void)showMessage:(NSString *)message
           duration:(NSTimeInterval)duration
           position:(id)position
              style:(CSToastStyle *)style;
@end
