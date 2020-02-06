#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface LoanArmy : NSObject
@property (nonatomic, retain)NSString *title;
@property (nonatomic, retain)NSString *rule;
+ (LoanArmy *)setModelWithDictionary:(NSDictionary *)dic;
@end
NS_ASSUME_NONNULL_END
