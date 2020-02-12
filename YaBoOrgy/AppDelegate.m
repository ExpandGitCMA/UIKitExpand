#import "AppDelegate.h"
#import "AppDelegate+ApptabBar.h"
#import <UMCommon/UMCommon.h>


@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    [self launchAppAppearance];

    return YES;
}

-(void)registerPushWithKey:(NSString*)key{
     [UMConfigure initWithAppkey:@"5e3a3feda904a9297aeefed1" channel:@"App Store"];
}
@end
