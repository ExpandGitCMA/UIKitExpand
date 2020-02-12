#import "AppDelegate+ApptabBar.h"
#import "AppColorHeader.h"

@implementation AppDelegate (ApptabBar)


-(void)launch{
    [[UITabBar appearance] setTintColor:kUIColorFromRGB(AppScore)];
    [[UINavigationBar appearance] setBarTintColor:kUIColorFromRGB(AppScore)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor], NSForegroundColorAttributeName,[UIFont fontWithName:@"PingFang-SC-Medium" size: 18], NSFontAttributeName, nil]];
}
@end
