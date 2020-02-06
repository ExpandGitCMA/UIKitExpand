#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface ThunderAroundShore : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *image;
+ (ThunderAroundShore *)setModelWithDictionary:(NSDictionary *)dic ;
@end
NS_ASSUME_NONNULL_END
