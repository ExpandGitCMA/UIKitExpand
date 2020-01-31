
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessAgeModel : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *image;
+ (MessAgeModel *)setModelWithDictionary:(NSDictionary *)dic ;
@end

NS_ASSUME_NONNULL_END
