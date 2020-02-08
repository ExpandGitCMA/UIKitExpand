#import "RuleModel.h"
@implementation  RuleModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ ( RuleModel *)setModelWithDictionary:(NSDictionary *)dic {
     RuleModel *tick = [[ RuleModel alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
