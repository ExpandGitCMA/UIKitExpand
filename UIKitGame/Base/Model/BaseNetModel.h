#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface BaseNetModel : BaseModel
#pragma mark -
@property(nonatomic, copy ) NSString * requestUrl;  
@property(nonatomic,strong)NSDictionary *params;  
@property(nonatomic,strong)NSDictionary *headParams;  
@property(nonatomic,assign)NSInteger ok;
@property(nonatomic, copy )NSString *msg;
@property(nonatomic, strong)NSDictionary *allResult;
@property(nonatomic,strong)id result;
- (BOOL)isDataSuccess;
- (BOOL)isNetError;
+ (instancetype)successModel:(id)response
                   urlString:(NSString *)urlString
                      params:(NSDictionary *)params
                  headParams:(NSDictionary *)headParams;
+ (instancetype)netErrorModel:(NSString *)error;
+ (NSDictionary *)analysisData:(id)response;
+ (NSString *)analysisError:(NSError *)error;
@end
