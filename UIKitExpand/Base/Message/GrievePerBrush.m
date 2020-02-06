#import "GrievePerBrush.h"
@implementation GrievePerBrush
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ ( GrievePerBrush *)setModelWithDictionary:(NSDictionary *)dic {
     GrievePerBrush *tick = [[ GrievePerBrush alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end


