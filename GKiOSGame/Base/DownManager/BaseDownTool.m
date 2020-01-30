//
//  BaseDownTool.m
//  GKiOSDownload
//
//  Created by wangws1990 on 2019/7/9.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "BaseDownTool.h"


@implementation AFDownTool
+ (NSURLSessionDownloadTask *)baseDownUrl:(NSString *)downUrl
                                 progress:(void (^)(NSProgress *pro))progress
                               completion:(void (^)(NSURL *filePath, NSError *error))completion{
    return [AFDownTool downTask:downUrl resumeData:nil progress:progress completion:completion];
}
+ (NSURLSessionDownloadTask *)baseDownData:(NSData *)resumeData
                                  progress:(void (^)(NSProgress *pro))progress
                                completion:(void (^)(NSURL *filePath, NSError *error))completion{
    return [AFDownTool downTask:nil resumeData:resumeData progress:progress completion:completion];
}
+ (NSURLSessionDownloadTask *)downTask:(NSString *)downUrl
                            resumeData:(NSData *)resumeData
                              progress:(void (^)(NSProgress *pro))progress
                            completion:(void (^)(NSURL *filePath, NSError *error))completion{
    NSURLSessionDownloadTask *task = nil;
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    if (resumeData) {
        task = [manger downloadTaskWithResumeData:resumeData progress:^(NSProgress * _Nonnull downloadProgress) {
            dispatch_async(dispatch_get_main_queue(), ^{
                !progress ?: progress(downloadProgress);
            });
        } destination:^NSURL * _Nonnull(NSURL * _Nonnull path, NSURLResponse * _Nonnull response) {
            NSString *targetPath = [AFDownTool downloadPath];
            NSString *fullPath = [targetPath stringByAppendingPathComponent:response.suggestedFilename];
            return [NSURL fileURLWithPath:fullPath];
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                !completion ?: completion(filePath,error);
            });
        }];
    }else{
        assert(downUrl);
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:downUrl] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:15];
        task = [manger downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
            dispatch_async(dispatch_get_main_queue(), ^{
                !progress ?: progress(downloadProgress);
            });
        } destination:^NSURL * _Nonnull(NSURL * _Nonnull path, NSURLResponse * _Nonnull response) {
            NSString *targetPath = [AFDownTool downloadPath];
            NSString *fullPath = [targetPath stringByAppendingPathComponent:response.suggestedFilename];
            return [NSURL fileURLWithPath:fullPath];
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                !completion ?: completion(filePath,error);
            });
        }];
    }
    [task resume];
    return task;
}
+ (NSString *)downloadPath{
    NSString * path = [NSHomeDirectory() stringByAppendingString:@"/Documents/Caches/Download"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        BOOL res = [[NSFileManager defaultManager]createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        if (res) {
            NSLog(@"create successful");
        }
    }
    return path;
}
@end

@implementation SectionDownTool
+ (instancetype )shareInstance
{
    static SectionDownTool * dataBase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!dataBase) {
            dataBase = [[[self class] alloc] init];
        }
    });
    return dataBase;
}
+ (NSURLSessionDownloadTask *)baseDownUrl:(NSString *)downUrl
                                 progress:(void (^)(NSProgress *pro))progress
                               completion:(void (^)(NSURL *filePath, NSError *error))completion{
    return [SectionDownTool downTask:downUrl resumeData:nil progress:progress completion:completion];
}
+ (NSURLSessionDownloadTask *)baseDownData:(NSData *)resumeData
                                  progress:(void (^)(NSProgress *pro))progress
                                completion:(void (^)(NSURL *filePath, NSError *error))completion{
    return [SectionDownTool downTask:nil resumeData:resumeData progress:progress completion:completion];
}
+ (NSURLSessionDownloadTask *)downTask:(NSString *)downUrl
                            resumeData:(NSData *)resumeData
                              progress:(void (^)(NSProgress *pro))progress
                            completion:(void (^)(NSURL *filePath, NSError *error))completion{
    SectionDownTool *downTask = [SectionDownTool shareInstance];
    downTask.completion = completion;
    downTask.progress = progress;
    NSURLSessionDownloadTask *task = nil;
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.shouldUseExtendedBackgroundIdleMode = YES;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:downTask delegateQueue:[NSOperationQueue mainQueue]];
    if (resumeData) {
        task = [session downloadTaskWithResumeData:resumeData];
    }else{
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:downUrl] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:15];
        task = [session downloadTaskWithRequest:request];
    }
    [task resume];
    return task;
}
#pragma mark NSURLSessionDownloadDelegate
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    SectionDownTool *downTask = [SectionDownTool shareInstance];
    NSProgress *pro = [[NSProgress alloc] init];
    pro.totalUnitCount = totalBytesExpectedToWrite;
    pro.completedUnitCount = totalBytesWritten;
    !downTask.progress ?: downTask.progress(pro);
}
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    [self downloadTaskFinish:downloadTask.response location:location];
}
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    if (!error) {
        return;
    }
    SectionDownTool *downTask = [SectionDownTool shareInstance];
    !downTask.completion ?: downTask.completion(nil,error);
}
- (BOOL)downloadTaskFinish:(NSURLResponse *)response location:(NSURL *)location
{
    SectionDownTool *downTask = [SectionDownTool shareInstance];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *cachePath = [SectionDownTool downloadPath];
    NSString *fullPath = [cachePath stringByAppendingPathComponent:response.suggestedFilename];
    //将文件转移到安全的地方去
    NSError *error = nil;
    BOOL res =  [fileManager moveItemAtPath:location.path toPath:fullPath error:&error];
    if (res && !error) {
        !downTask.completion ?: downTask.completion([NSURL fileURLWithPath:fullPath],error);
    }
    return res;
}
+ (NSString *)downloadPath{
    NSString * path = [NSHomeDirectory() stringByAppendingString:@"/Documents/Caches/Download"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        BOOL res = [[NSFileManager defaultManager]createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        if (res) {
            NSLog(@"create successful");
        }
    }
    return path;
}

@end
