#import "NewModel.h"
@implementation NewModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (NewModel *)setModelWithDictionary:(NSDictionary *)dic {
    NewModel *tick = [[NewModel alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
