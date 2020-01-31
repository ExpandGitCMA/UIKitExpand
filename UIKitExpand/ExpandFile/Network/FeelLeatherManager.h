#import <AFNetworking/AFNetworking.h>
#import "AppHeaderFile.h"
typedef void (^HttpCompletedBlock)(BOOL ret, id obj);
@interface FeelLeatherManager : AFHTTPSessionManager
+ (instancetype)sharedManager;
- (void)tryHeapUseful:(NSString *)path params:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
- (void)accidentalTunnel:(NSString *)path params:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
-(void)lookChemist:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
- (void)requestWithLocalFileWithName:(NSString *)name completed:(HttpCompletedBlock)completed;
@end
