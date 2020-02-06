#import "SufferHardwareGracious.h"
@implementation NewsModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (NewsModel *)setModelWithDictionary:(NSDictionary *)dic {
    NewsModel *tick = [[NewsModel alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
@implementation SufferHardwareGracious
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (SufferHardwareGracious *)setModelWithDictionary:(NSDictionary *)dic {
    SufferHardwareGracious *tick = [[SufferHardwareGracious alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
