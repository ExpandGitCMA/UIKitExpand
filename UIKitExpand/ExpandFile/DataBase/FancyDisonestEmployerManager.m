#import "FancyDisonestEmployerManager.h"
static FancyDisonestEmployerManager *userManager = nil;
@implementation FancyDisonestEmployerManager
- (id)copyWithZone:(NSZone *)zone {
    return [[FancyDisonestEmployerManager allocWithZone:zone] init];
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
- (void)assembleMainlyFacialAnt:(FavourOpposedExperiment *)user{
    _user = user;
     [NSKeyedArchiver archiveRootObject:user toFile:[self cacheDir]];
}
- (NSString *)cacheDir{
    NSString *addressPath=[NSString stringWithFormat:@"%@/%@",[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject],@"FavourOpposedExperiment.data"];
    NSLog(@"%@",addressPath);
    return addressPath;
}
- (void)locateLightlyDependentPreparation{
    if( [[NSFileManager defaultManager] fileExistsAtPath:[self cacheDir]]){
        [[NSFileManager defaultManager] removeItemAtPath:[self cacheDir] error:nil];
    }
    _user = nil;
}
@end
