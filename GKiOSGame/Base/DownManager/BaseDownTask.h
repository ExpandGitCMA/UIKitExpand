//
//  BaseDownTask.h
//  GKiOSNovel
//
//  Created by wangws1990 on 2019/7/3.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, GKDownTaskState) {
    GKDownTaskDefault =  0,//未下载
    GKDownTaskLoading =  1,//下载中
    GKDownTaskPause   =  2,//暂停中
    GKDownTaskFinish  =  3,//下载完成
};
NS_ASSUME_NONNULL_BEGIN
@class BaseDownModel;

@interface BaseDownTask : NSObject
/**
 @brief 文件下载
 @param downUrl 要下载的url
 @param progress 进度
 @param completion 下载完成回调
 @return NSURLSessionDownloadTask
 */
+ (NSURLSessionDownloadTask *)baseDownUrl:(NSString *)downUrl
                                 progress:(void (^)(NSProgress *pro))progress
                               completion:(void (^)(NSURL *filePath, NSError *error))completion;
/**
 @brief 文件下载
 @param data 要下载的data 断点续传
 @param progress 进度
 @param completion 下载完成回调
 @return NSURLSessionDownloadTask
 */
+ (NSURLSessionDownloadTask *)baseDownData:(NSData *)data
                                  progress:(void (^)(NSProgress *pro))progress
                                completion:(void (^)(NSURL *filePath, NSError *error))completion;
@end

@interface BaseDownModel : BaseModel

@property (nonatomic, copy) NSString *downId;                  // 文件唯一id标识
@property (nonatomic, copy) NSString *path;                    // 下载完成路径
@property (nonatomic, copy) NSString *url;                     // url 下载url
@property (nonatomic, strong) NSData *resumeData;              // 下载的数据 可以用于断点续传
@property (nonatomic, assign) CGFloat progress;                // 下载进度
@property (nonatomic, assign) GKDownTaskState state;           // 下载状态
@property (nonatomic, assign) NSUInteger totalSize;            // 文件总大小
@property (nonatomic, assign) NSUInteger tempSize;             // 下载大小
//id 和 URL 必须要有
+ (instancetype)vcWithDownId:(NSString *)downId url:(NSString *)url;
@end

NS_ASSUME_NONNULL_END
