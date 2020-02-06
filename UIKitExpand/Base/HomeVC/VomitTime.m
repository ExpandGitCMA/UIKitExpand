#import "VomitTime.h"
@implementation NewsModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (NewsModel *)setModelWithDictionary:(NSDictionary *)dic {
    NewsModel *tick = [[NewsModel alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
@implementation VomitTime
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (VomitTime *)setModelWithDictionary:(NSDictionary *)dic {
    VomitTime *tick = [[VomitTime alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end


