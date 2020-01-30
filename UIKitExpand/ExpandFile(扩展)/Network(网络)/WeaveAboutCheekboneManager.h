#import <AFNetworking/AFNetworking.h>
#import "AppHeaderFile.h"
typedef void (^HttpCompletedBlock)(BOOL ret, id obj);
@interface WeaveAboutCheekboneManager : AFHTTPSessionManager
+ (instancetype)sharedManager;
- (void)lendGate:(NSString *)path params:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
- (void)trustDaytime:(NSString *)path params:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
-(void)requestHomeNews:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
@end
