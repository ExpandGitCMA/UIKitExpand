#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NewsSportModel : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *image;
@property (nonatomic, copy)NSString *time;
@property (nonatomic, copy)NSString *content;
+ (NewsSportModel *)setModelWithDictionary:(NSDictionary *)dic;
@end
NS_ASSUME_NONNULL_END
