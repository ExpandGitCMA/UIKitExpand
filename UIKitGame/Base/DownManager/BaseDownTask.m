#import "BaseDownTask.h"
#import "BaseDownTool.h"
static BOOL Afnetwork = YES;
@implementation BaseDownTask
+ (NSURLSessionDownloadTask *)baseDownData:(NSData *)data
                                  progress:(void (^)(NSProgress *pro))progress
                                completion:(void (^)(NSURL *filePath, NSError *error))completion{
    return [BaseDownTask baseDownUrl:nil resumeData:data progress:progress completion:completion];
}
+ (NSURLSessionDownloadTask *)baseDownUrl:(NSString *)downUrl
                                 progress:(void (^)(NSProgress *pro))progress
                               completion:(void (^)(NSURL *filePath, NSError *error))completion{
    return [BaseDownTask baseDownUrl:downUrl resumeData:nil progress:progress completion:completion];
}
+ (NSURLSessionDownloadTask *)baseDownUrl:(NSString *)downUrl
                               resumeData:(NSData *)resumeData
                                 progress:(void (^)(NSProgress *pro))progress
                               completion:(void (^)(NSURL *filePath, NSError *error))completion{
    if (Afnetwork) {
        return [AFDownTool downTask:downUrl resumeData:resumeData progress:progress completion:completion];
    }
    return [SectionDownTool downTask:downUrl resumeData:resumeData progress:progress completion:completion];
}
@end
@implementation BaseDownModel
+ (instancetype)vcWithDownId:(NSString *)downId url:(NSString *)url{
    BaseDownModel *vc = [[[self class] alloc] init];
    vc.downId = downId;
    vc.url = url;
    return vc;
}
@end 
