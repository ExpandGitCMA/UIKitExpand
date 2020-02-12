#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface BeatLikeNewspaper : NSObject
@property (nonatomic, retain)NSString *title;
@property (nonatomic, retain)NSString *rule;
+ (BeatLikeNewspaper *)setModelWithDictionary:(NSDictionary *)dic;
@end
NS_ASSUME_NONNULL_END
