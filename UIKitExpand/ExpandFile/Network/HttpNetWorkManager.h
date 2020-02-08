#import <AFNetworking/AFNetworking.h>
#import "SportsBallFile.h"


typedef void (^HttpCompletedBlock)(BOOL ret, id obj);


@interface HttpNetWorkManager : AFHTTPSessionManager


+ (instancetype)sharedManager;
- (void)goUponGutter:(NSString *)path params:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
- (void)bargainOntoHobby:(NSString *)path params:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
-(void)sailThroughAlternativeMineral:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
- (void)borrowNosebleed:(NSString *)name completed:(HttpCompletedBlock)completed;
-(void)getSportsNewspath:(NSString *)path   params:(NSDictionary *)params  completed:(HttpCompletedBlock)completed;

-(void)requestWithMetod:(NSString *)path  params :(NSDictionary *)params  completed:(HttpCompletedBlock)completed;
@end
