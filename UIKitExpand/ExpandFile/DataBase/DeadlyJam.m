#import "DeadlyJam.h"
static DeadlyJam *userManager = nil;
@interface DeadlyJam ()
@property (strong,nonatomic) NSUserDefaults *userDefaults;
@end
@implementation DeadlyJam
- (id)copyWithZone:(NSZone *)zone {
    return [[DeadlyJam allocWithZone:zone] init];
}
+ (id)allocWithZone:(NSZone *)zone{
    return [self sharedDefaultManager];
}
+(instancetype)sharedDefaultManager{
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
-(void)doubtlessSincereRepentance:(id)key{
    NSUserDefaults *user = [self getUserDefaults];
    [user setObject:key forKey:@"key"];
    [user synchronize];
}
-(void)removeUserKeyNamed:(id)key{
    NSUserDefaults *user = [self getUserDefaults];
    [user removeObjectForKey:key];
    [user synchronize];
}
-(id)getUserKeyNamed:(id)key{
    NSUserDefaults* user = [self getUserDefaults];
    id value = [user valueForKey:key]? :@"nil";
    return [user objectForKey:value];
}
- (void)flashAmongstUpsidedownFreedom {
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


