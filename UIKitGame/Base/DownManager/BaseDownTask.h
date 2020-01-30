#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, GKDownTaskState) {
    GKDownTaskDefault =  0,
    GKDownTaskLoading =  1,
    GKDownTaskPause   =  2,
    GKDownTaskFinish  =  3,
};
NS_ASSUME_NONNULL_BEGIN
@class BaseDownModel;
@interface BaseDownTask : NSObject
+ (NSURLSessionDownloadTask *)baseDownUrl:(NSString *)downUrl
                                 progress:(void (^)(NSProgress *pro))progress
                               completion:(void (^)(NSURL *filePath, NSError *error))completion;
+ (NSURLSessionDownloadTask *)baseDownData:(NSData *)data
                                  progress:(void (^)(NSProgress *pro))progress
                                completion:(void (^)(NSURL *filePath, NSError *error))completion;
@end
@interface BaseDownModel : BaseModel
@property (nonatomic, copy) NSString *downId;                  
@property (nonatomic, copy) NSString *path;                    
@property (nonatomic, copy) NSString *url;                     
@property (nonatomic, strong) NSData *resumeData;              
@property (nonatomic, assign) CGFloat progress;                
@property (nonatomic, assign) GKDownTaskState state;           
@property (nonatomic, assign) NSUInteger totalSize;            
@property (nonatomic, assign) NSUInteger tempSize;             
+ (instancetype)vcWithDownId:(NSString *)downId url:(NSString *)url;
@end
NS_ASSUME_NONNULL_END
