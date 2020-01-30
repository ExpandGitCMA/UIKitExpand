#import "GKDownloadTask.h"
#import "GKDownDataQueue.h"
@interface GKDownloadTask ()
@property (strong, nonatomic) NSMutableDictionary *taskDatas;
@end
@implementation GKDownloadTask
+ (instancetype)defaults
{
    static GKDownloadTask *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc] init];
    });
    return _manager;
}
+ (void)startDownTask:(BaseDownModel *)model
             progress:(void (^)(NSProgress *pro))progress
           completion:(void (^)(NSString *path,NSError *error))completion{
    GKDownloadTask *task = [GKDownloadTask defaults];
    [GKDownDataQueue getDataFromDataBase:model.downId completion:^(BaseDownModel * _Nonnull downModel) {
        NSURLSessionDownloadTask * downTask = task.taskDatas[model.downId];
        if (downTask && downTask.state == NSURLSessionTaskStateRunning) {
            [downTask suspend];
            [downTask cancel];
        }
        BaseDownModel *newModel = downModel.resumeData.length > 0 ? downModel : model;
        if (newModel.resumeData.length > 0) {
            downTask = [BaseDownTask baseDownData:newModel.resumeData progress:^(NSProgress * _Nonnull pro) {
                !progress ?: progress(pro);
                [GKDownloadTask updateDownModel:newModel progress:pro];
            } completion:^(NSURL * _Nonnull filePath, NSError * _Nonnull error) {
                if ([error.localizedDescription isEqualToString:@"cancelled"]){
                    return;
                }
                NSArray *datas = [filePath.path componentsSeparatedByString:@"Download"];
                NSString *path = datas.lastObject;
                [GKDownloadTask updateDownModel:newModel filePath:path error:error];
                !completion ?: completion(path,error);
            }];
        }else{
            downTask = [BaseDownTask baseDownUrl:newModel.url progress:^(NSProgress * _Nonnull pro) {
                !progress ?: progress(pro);
                [GKDownloadTask updateDownModel:model progress:pro];
            } completion:^(NSURL * _Nonnull filePath, NSError * _Nonnull error) {
                if ([error.localizedDescription isEqualToString:@"cancelled"]){
                    return;
                }
                NSArray *datas = [filePath.path componentsSeparatedByString:@"Download"];
                NSString *path = datas.lastObject;
                [GKDownloadTask updateDownModel:newModel filePath:path error:error];
                !completion ?: completion(path,error);
            }];
        }
        assert(newModel.downId);
        newModel.state = GKDownTaskLoading;
        downTask.taskDescription = newModel.downId;
        task.taskDatas[model.downId?:@""] = downTask;
    }];
}
+ (void)pauseDownTask:(BaseDownModel *)model{
    [GKDownDataQueue getDataFromDataBase:model.downId completion:^(BaseDownModel * _Nonnull downModel) {
        BaseDownModel *newModel  = downModel ? downModel : model;
        [GKDownloadTask cancelTask:newModel completion:nil];
    }];
}
+ (void)deleteDownTask:(BaseDownModel *)model{
    [GKDownloadTask cancelTask:model completion:^{
        GKDownloadTask *loadTask = [GKDownloadTask defaults];
        [loadTask.taskDatas removeObjectForKey:model.downId];
        [GKDownDataQueue deleteDataToDataBase:model.downId completion:nil];
        NSError *error = nil;
        BOOL res = [[NSFileManager defaultManager] removeItemAtPath:model.path error:&error];
        if (!error && res) {
            NSLog(@"数据重本地文件中删除成功");
        }
    }];
}
#pragma mark
+ (void)cancelTask:(BaseDownModel *)model completion:(void (^)(void))completion
{
    GKDownloadTask *loadTask = [GKDownloadTask defaults];
    NSURLSessionDownloadTask *task = [loadTask.taskDatas valueForKey:model.downId];
    if (task.state == NSURLSessionTaskStateRunning && task) {
        [task suspend];
        loadTask.taskDatas[model.downId?:@""] = task;
        [task cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
            model.resumeData = resumeData;
            [GKDownloadTask updateDownModel:model];
            !completion ?: completion();
        }];
    }else{
        !completion ?: completion();
    }
}
+ (void)updateDownModel:(BaseDownModel *)model filePath:(NSString *)filePath error:(NSError *)error{
    NSData *resumeData = [error.userInfo objectForKey:NSURLSessionDownloadTaskResumeData];
    if (resumeData.length > 0) {
        model.resumeData = resumeData;
    }
    resumeData = [error.userInfo objectForKey:NSURLErrorBackgroundTaskCancelledReasonKey];
    if (resumeData.length > 0) {
        model.resumeData = resumeData;
    }
    if (!error &&filePath) {
         GKDownloadTask *loadTask = [GKDownloadTask defaults];
         model.state = GKDownTaskFinish;
         model.progress  = 1.0f;
         model.path = filePath;
         [loadTask.taskDatas removeObjectForKey:model.downId];
    }
    [GKDownloadTask updateDownModel:model];
}
+ (void)updateDownModel:(BaseDownModel *)model progress:(NSProgress *)progress{
    model.totalSize = progress.totalUnitCount;
    model.tempSize = progress.completedUnitCount;
    model.progress = progress.fractionCompleted;
    GKDownloadTask *loadTask = [GKDownloadTask defaults];
    NSURLSessionDownloadTask *task = [loadTask.taskDatas valueForKey:model.downId];
    if (task && task.state == NSURLSessionTaskStateRunning) {
        [GKDownloadTask updateDownModel:model];
    }
}
+ (void)updateDownModel:(BaseDownModel *)model{
    [GKDownDataQueue insertDataToDataBase:model completion:nil];
}
- (NSMutableDictionary *)taskDatas{
    if (!_taskDatas) {
        _taskDatas = [[NSMutableDictionary alloc] init];
    }
    return _taskDatas;
}
@end
