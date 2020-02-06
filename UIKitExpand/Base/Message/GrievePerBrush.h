#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface GrievePerBrush : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *image;
+ (GrievePerBrush *)setModelWithDictionary:(NSDictionary *)dic ;
@end
NS_ASSUME_NONNULL_END


