//
//  BaseDownTool.h
//  GKiOSDownload
//
//  Created by wangws1990 on 2019/7/9.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseDownToolProtocol <NSObject>
@required
+ (NSURLSessionDownloadTask *)baseDownUrl:(NSString *)downUrl
                                 progress:(void (^)(NSProgress *pro))progress
                               completion:(void (^)(NSURL *filePath, NSError *error))completion;
+ (NSURLSessionDownloadTask *)baseDownData:(NSData *)data
                                  progress:(void (^)(NSProgress *pro))progress
                                completion:(void (^)(NSURL *filePath, NSError *error))completion;
/**
 @brief 文件下载
 @param downUrl 要下载的url
 @param resumeData 已下载的resumeData(如果有此值优先断点续传）
 @param progress 进度
 @param completion 下载完成回调
 @return NSURLSessionDownloadTask
 */
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

