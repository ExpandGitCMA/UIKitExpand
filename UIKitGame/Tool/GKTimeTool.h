#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface GKTimeTool : NSObject
+ (NSString *)timeStampTurnToDate:(NSTimeInterval)timesTamp;
+ (NSString *)timeStampTurnToTimes:(NSTimeInterval)times;
+ (NSString *)getTimeStamp;
@end
NS_ASSUME_NONNULL_END
