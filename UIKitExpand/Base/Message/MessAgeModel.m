

#import "MessAgeModel.h"

@implementation MessAgeModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ ( MessAgeModel *)setModelWithDictionary:(NSDictionary *)dic {
     MessAgeModel *tick = [[ MessAgeModel alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
