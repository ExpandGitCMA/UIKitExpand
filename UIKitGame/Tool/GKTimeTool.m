#import "GKTimeTool.h"
@implementation GKTimeTool
+ (NSString *)timeStampTurnToDate:(NSTimeInterval)timesTamp
{
    if (timesTamp == 0) {
        return @"";
    }
    NSTimeInterval interval    = timesTamp;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm"];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}
+ (NSString *)timeStampTurnToTimes:(NSTimeInterval)times
{
    NSString *type = times > 3600 ? @"hh:mm:ss":@"mm:ss";
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:times];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:type];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}
+ (NSString *)getTimeStamp{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];
    return timeString;
}
@end
