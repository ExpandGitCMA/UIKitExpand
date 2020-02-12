#import "NewsSportModel.h"
@implementation NewsSportModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (NewsSportModel *)setModelWithDictionary:(NSDictionary *)dic {
    NewsSportModel *tick = [[NewsSportModel alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
