#import <AFNetworking/AFNetworking.h>
#import "AppHeaderFile.h"
typedef void (^HttpCompletedBlock)(BOOL ret, id obj);
@interface WeaveAboutCheekboneManager : AFHTTPSessionManager
+ (instancetype)sharedManager;
- (void)lendGate:(NSString *)path params:(NSMutableDictionary *)params completed:(HttpCompletedBlock)completed;
- (void)trustDaytime:(NSString *)path params:(NSMutableDictionary *)params completed:(HttpCompletedBlock)completed;
@end
