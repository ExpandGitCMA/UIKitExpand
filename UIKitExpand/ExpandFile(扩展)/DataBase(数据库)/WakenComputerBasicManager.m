#import "WakenComputerBasicManager.h"
static WakenComputerBasicManager *userManager = nil;
@implementation WakenComputerBasicManager
- (id)copyWithZone:(NSZone *)zone {
    return [[WakenComputerBasicManager allocWithZone:zone] init];
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
- (instancetype)init{
    if (self = [super init]) {
        _user = [NSKeyedUnarchiver unarchiveObjectWithFile:[self cacheDir]];
    }
    return self;
}
- (void)reactDuringSuccessiveAcid:(ScareBesidesHurding *)user{
    _user = user;
     [NSKeyedArchiver archiveRootObject:user toFile:[self cacheDir]];
}
- (NSString *)cacheDir{
    NSString *addressPath=[NSString stringWithFormat:@"%@/%@",[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject],@"ScareBesidesHurding.data"];
    NSLog(@"%@",addressPath);
    return addressPath;
}
- (void)widenIndoorsUnexpectedDinner{
    if( [[NSFileManager defaultManager] fileExistsAtPath:[self cacheDir]]){
        [[NSFileManager defaultManager] removeItemAtPath:[self cacheDir] error:nil];
    }
    _user = nil;
}
@end


