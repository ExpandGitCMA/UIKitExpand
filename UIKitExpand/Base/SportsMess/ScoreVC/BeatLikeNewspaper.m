#import "BeatLikeNewspaper.h"
@implementation BeatLikeNewspaper
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (BeatLikeNewspaper *)setModelWithDictionary:(NSDictionary *)dic {
    BeatLikeNewspaper *tick = [[BeatLikeNewspaper alloc] init];
    [tick setValuesForKeysWithDictionary:dic];
    return tick;
}
@end
