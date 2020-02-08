#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface  RuleModel : NSObject
@property (nonatomic, retain)NSString *title;
@property (nonatomic, retain)NSString *rule;
+ ( RuleModel *)setModelWithDictionary:(NSDictionary *)dic;
@end
NS_ASSUME_NONNULL_END
