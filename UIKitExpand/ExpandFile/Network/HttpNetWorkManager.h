#import <AFNetworking/AFNetworking.h>
#import "AppUrlprotocol.h"


typedef void (^HttpCompletedBlock)(BOOL ret, id obj);


@interface HttpNetWorkManager : AFHTTPSessionManager


+ (instancetype)sharedManager;


- (void)requestGetMetod:(NSString *)path
        params:(NSDictionary *)params completed:(HttpCompletedBlock)completed;

- (void)requestPOSTMetod:(NSString *)path
        params:(NSDictionary *)params completed:(HttpCompletedBlock)completed;

- (void)borrowNosebleed:(NSString *)name completed:(HttpCompletedBlock)completed;

 -(void)getNewsSportpath:(NSString *)path
        params:(NSDictionary *)params  completed:(HttpCompletedBlock)completed;


@end
