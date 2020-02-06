#import "ThunderAroundShore.h"
@implementation ThunderAroundShore
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ ( ThunderAroundShore *)setModelWithDictionary:(NSDictionary *)dic {
     ThunderAroundShore *tick = [[ ThunderAroundShore alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
