#import "BackwardTallWreck.h"

@implementation NewsModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (NewsModel *)setModelWithDictionary:(NSDictionary *)dic {
    NewsModel *tick = [[NewsModel alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end

@implementation BackwardTallWreck
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (BackwardTallWreck *)setModelWithDictionary:(NSDictionary *)dic {
    BackwardTallWreck *tick = [[BackwardTallWreck alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
