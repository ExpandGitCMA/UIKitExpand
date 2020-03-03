#import <UIKit/UIKit.h>
#import "ALRouter.h"
#import <SVProgressHUD.h>
#import <AVOSCloud/AVOSCloud.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
-(void)launchOptionsPushCenter:(NSString*)key;
@end
