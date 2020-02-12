#import "Leagstus.h"
@implementation Leagstus
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ ( Leagstus *)setModelWithDictionary:(NSDictionary *)dic {
     Leagstus *tick = [[Leagstus alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
