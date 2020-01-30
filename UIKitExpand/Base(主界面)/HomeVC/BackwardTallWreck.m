#import "BackwardTallWreck.h"
@implementation BackwardTallWreck
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (BackwardTallWreck *)setModelWithDictionary:(NSDictionary *)dic {
    BackwardTallWreck *tick = [[BackwardTallWreck alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end


