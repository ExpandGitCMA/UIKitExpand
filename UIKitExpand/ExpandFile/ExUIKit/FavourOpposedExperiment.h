#import <Foundation/Foundation.h>
@interface FavourOpposedExperiment : NSObject
@property (nonatomic,copy) NSString *imgUrl; 
@property (nonatomic,copy) NSString *name;  
@property (nonatomic,copy) NSString *mobile;    
@property (nonatomic,copy) NSString *sex;   
@property (nonatomic,copy) NSString *createDate;    
@property (nonatomic,copy) NSString *userCode;   
@property (nonatomic,copy) NSString *userId;    
@property (nonatomic,copy) NSString *userToken; 
+ (instancetype)userWithDict:(NSDictionary *)dict;
@end
