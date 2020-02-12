
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YoBoLoginUser : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *mobile;
@property (nonatomic,copy) NSString *token;
@property (nonatomic,copy) NSString *uid;
@property (nonatomic,copy) NSDictionary*user_info;

+ (instancetype)userWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
