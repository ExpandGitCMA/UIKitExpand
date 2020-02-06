#import "BeforeFaithfulSomething.h"
@implementation BeforeFaithfulSomething
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (BeforeFaithfulSomething *)setModelWithDictionary:(NSDictionary *)dic {
    BeforeFaithfulSomething *tick = [[BeforeFaithfulSomething alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end


