#import <Foundation/Foundation.h>
@protocol BaseDownToolProtocol <NSObject>
@required
+ (NSURLSessionDownloadTask *)baseDownUrl:(NSString *)downUrl
                                 progress:(void (^)(NSProgress *pro))progress
                               completion:(void (^)(NSURL *filePath, NSError *error))completion;
+ (NSURLSessionDownloadTask *)baseDownData:(NSData *)data
                                  progress:(void (^)(NSProgress *pro))progress
                                completion:(void (^)(NSURL *filePath, NSError *error))completion;
+ (NSURLSessionDownloadTask *)downTask:(NSString *)downUrl
                            resumeData:(NSData *)resumeData
                              progress:(void (^)(NSProgress *pro))progress
                            completion:(void (^)(NSURL *filePath, NSError *error))completion;
+ (NSString *)downloadPath;
@end
@interface AFDownTool : NSObject<BaseDownToolProtocol>
@end
@interface SectionDownTool : NSObject<BaseDownToolProtocol,NSURLSessionDownloadDelegate>
@property (copy, nonatomic)void (^progress)(NSProgress *pro);
@property (copy, nonatomic)void (^completion)(NSURL *filePath, NSError *error);
@end
