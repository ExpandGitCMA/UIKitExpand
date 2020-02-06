#import <AFNetworking/AFNetworking.h>
#import "SportsBallFile.h"
typedef void (^HttpCompletedBlock)(BOOL ret, id obj);
@interface CopyManmadeCatastropheManager : AFHTTPSessionManager
+ (instancetype)sharedManager;
- (void)tenderLandmine:(NSString *)path params:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
- (void)drillThatSleepyWeek:(NSString *)path params:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
-(void)relaxViaNiece:(NSDictionary *)params completed:(HttpCompletedBlock)completed;
- (void)downMinusCeremony:(NSString *)name completed:(HttpCompletedBlock)completed;
@end
