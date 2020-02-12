#import "UncertainTransfusion.h"
static UncertainTransfusion *userManager = nil;
static NSString *const presentCache = @"presentCache";
@interface UncertainTransfusion ()
@property (strong,nonatomic) NSUserDefaults *userDefaults;
@end
@implementation UncertainTransfusion
- (id)copyWithZone:(NSZone *)zone {
    return [[UncertainTransfusion allocWithZone:zone] init];
}
+ (id)allocWithZone:(NSZone *)zone{
    return [self defaultUser];
}
+(instancetype)defaultUser{
    static dispatch_once_t dispatch;
    dispatch_once(&dispatch , ^{
        if (!userManager) {
            userManager = [[super allocWithZone:NULL] init];
        }
    });
    return userManager;
}
-(NSUserDefaults *)getUserDefaults{
    if (_userDefaults == nil) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return _userDefaults;
}
- (NSString *)defaultsKeyForPropertyNamed:(char const *)propertyName {
    return [NSString stringWithFormat:@"%s", propertyName];
}
-(void)chewCloak:(id)key{
    if (key != nil) {
        NSUserDefaults* user = [self getUserDefaults];
        [user setObject:key forKey:presentCache];
        [user synchronize];
    }
}
-(void)removeUserKeyNamed:(id)key{
    NSUserDefaults *user = [self getUserDefaults];
    [user removeObjectForKey:key];
    [user synchronize];
}
-(NSString*)getApresentTimer{
    NSUserDefaults* user = [self getUserDefaults];
    NSString* presentTimer = [user objectForKey:presentCache];
    return presentTimer;
}
-(id)getUserKeyNamed:(id)key{
    NSUserDefaults* user = [self getUserDefaults];
    id value = [user valueForKey:key]? :@"nil";
    return [user objectForKey:value];
}
- (void)preserveMicrophone {
    NSUserDefaults* defs = [self getUserDefaults];
    NSDictionary* dict = [defs dictionaryRepresentation];
    for(id key in dict) {
          [defs removeObjectForKey:key];
    }
    [defs synchronize];
}
- (void)removeDefaults {
    NSString*appDomain = [[NSBundle mainBundle]bundleIdentifier];
    [[NSUserDefaults standardUserDefaults]removePersistentDomainForName:appDomain];
}
@end
