#import "LoanArmy.h"
@implementation LoanArmy
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (LoanArmy *)setModelWithDictionary:(NSDictionary *)dic {
    LoanArmy *tick = [[LoanArmy alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
