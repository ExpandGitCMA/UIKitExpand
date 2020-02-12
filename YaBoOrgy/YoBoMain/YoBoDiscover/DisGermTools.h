#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@class DisBamboo;
@interface DisGermTools : NSObject
+(instancetype)slidingDiaryShare;
-(void)updateObjectsLiker:(DisBamboo *)model;
-(void)saveObjects:(NSMutableArray *)marrModel;
-(void)deleteObjectByFormat:(DisBamboo *)noteModel;
-(NSMutableArray *)getAllDiaryMOdelArr;
@end
NS_ASSUME_NONNULL_END
