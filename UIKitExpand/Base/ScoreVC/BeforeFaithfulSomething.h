#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface BeforeFaithfulSomething : NSObject
@property (nonatomic, retain)NSString *title;
@property (nonatomic, retain)NSString *rule;
+ (BeforeFaithfulSomething *)setModelWithDictionary:(NSDictionary *)dic;
@end
NS_ASSUME_NONNULL_END
