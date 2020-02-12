#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@class YoBoDisModel;
@interface YoBoGermTools : NSObject
+(instancetype)toolsShareManer;
-(void)updateObjectsLiker:(YoBoDisModel *)model;
-(void)saveObjects:(NSMutableArray *)ObjectsModel;
-(void)deleteObject:(YoBoDisModel *)model;
-(NSMutableArray *)getToolsOdelArr;
@end
NS_ASSUME_NONNULL_END
