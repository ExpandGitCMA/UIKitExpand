#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@class YoBoDisModel;
@interface YoBoGermTools : NSObject
+(instancetype)slidingDiaryShare;
-(void)updateObjectsLiker:(YoBoDisModel *)model;
-(void)saveObjects:(NSMutableArray *)ObjectsModel;
-(void)deleteObject:(YoBoDisModel *)model;
-(NSMutableArray *)getAllDiaryMOdelArr;
@end
NS_ASSUME_NONNULL_END
