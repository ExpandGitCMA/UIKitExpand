#import "AppDelegate+ApptabBar.h"
#import "AppColorHeader.h"
#import "UncertainTransfusion.h"
#import "FeelLeatherManager.h"
@implementation AppDelegate (ApptabBar)
-(void)launchAppAppearance{
    [[FeelLeatherManager sharedManager] requestWithLocalFileWithName:@"seteid" completed:^(BOOL ret, id obj) {
          NSDictionary*dict = [obj objectForKey:@"default"];
          NSString  *seteid  = [dict objectForKey:@"seteid"];
          UInt32 Color;
         [[UncertainTransfusion sharedDefaultManager]chewCloak:seteid];
         switch ([seteid integerValue]) {
             case 1:{
                 Color = AppMianColor;
             }break;
             case 2:{
                  Color = AppScore;
              }break;
             default:{
                  Color = AppMianColor;
             }
                 break;
         }
         [[UITabBar appearance] setTintColor:kUIColorFromRGB(Color)];
         [[UINavigationBar appearance] setBarTintColor:kUIColorFromRGB(Color)];
      }];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor], NSForegroundColorAttributeName,[UIFont fontWithName:@"PingFang-SC-Medium" size: 18], NSFontAttributeName, nil]];
}
@end
