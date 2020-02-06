#import "AppDelegate+ApptabBar.h"
#import "SportsColorHeader.h"
@implementation AppDelegate (ApptabBar)
-(void)launchAppAppearance{
    [[UITabBar appearance] setTintColor:kUIColorFromRGB(AppMianColor)];
    [[UINavigationBar appearance] setBarTintColor:kUIColorFromRGB(AppMianColor)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor], NSForegroundColorAttributeName,[UIFont fontWithName:@"PingFang-SC-Medium" size: 18], NSFontAttributeName, nil]];
}
@end
