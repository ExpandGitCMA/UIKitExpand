#import <AFNetworking/AFNetworking.h>
#import "SportsBallFile.h"
typedef void (^HttpCompletedBlock)(BOOL ret, id obj);
@interface DisrespectfulLabourManager : AFHTTPSessionManager
+ (instancetype)sharedManager;
- (void)goUponGutter:(NSString *)path params:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
- (void)bargainOntoHobby:(NSString *)path params:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
-(void)sailThroughAlternativeMineral:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
- (void)borrowNosebleed:(NSString *)name completed:(HttpCompletedBlock)completed;
@end


