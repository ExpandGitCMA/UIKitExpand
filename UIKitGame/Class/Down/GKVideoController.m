#import "GKVideoController.h"
#import "GKDownModel.h"
#import "GKDownCell.h"
#import "GKVideoPlayController.h"
#import "GKDownloadTask.h"
#import "GKDownDataQueue.h"
@interface GKVideoController ()
@property (strong, nonatomic) NSMutableArray *listData;
@property (copy, nonatomic) NSString *tags;
@end
@implementation GKVideoController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self showNavTitle:@"下载"];
    self.listData = @[].mutableCopy;
    [self setupEmpty:self.tableView];
    [self setupRefresh:self.tableView option:ATRefreshNone];
}
- (void)refreshData:(NSInteger)page{
    self.listData = @[].mutableCopy;
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"video4" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:videoPath];
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
    if (!error) {
        NSArray *Datas = [NSArray modelArrayWithClass:GKDownModel.class json:dic[@"data"][@"video_list"]];
        [self.listData addObjectsFromArray:Datas];
    }
    videoPath = [[NSBundle mainBundle] pathForResource:@"video5" ofType:@"json"];
    jsonData = [NSData dataWithContentsOfFile:videoPath];
    error = nil;
    dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
    if (!error) {
        NSArray *Datas = [NSArray modelArrayWithClass:GKDownModel.class json:dic[@"data"][@"video_list"]];
        [self.listData addObjectsFromArray:Datas];
    }
    videoPath = [[NSBundle mainBundle] pathForResource:@"video6" ofType:@"json"];
    jsonData = [NSData dataWithContentsOfFile:videoPath];
    error = nil;
    dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
    if (!error) {
        NSArray *Datas = [NSArray modelArrayWithClass:GKDownModel.class json:dic[@"data"][@"video_list"]];
        [self.listData addObjectsFromArray:Datas];
    }
    [GKDownDataQueue getDatasFromDataBase:^(NSArray<BaseDownModel *> * _Nonnull datas) {
        [datas enumerateObjectsUsingBlock:^(BaseDownModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSPredicate *pre1 = [NSPredicate predicateWithFormat:@"video_log_id CONTAINS%@",obj.downId?:@""];
            GKDownModel *model  = [self.listData filteredArrayUsingPredicate:pre1].firstObject;
            model.path = obj.path;
            model.progress = obj.progress;
            model.taskState = (obj.state == GKDownTaskFinish) ? GKDownTaskFinish : GKDownTaskPause;
        }];
        [self.tableView reloadData];
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GKDownCell *cell = [GKDownCell cellForTableView:tableView indexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.listData[indexPath.row];
    @weakify(cell)
    [cell.downBtn setBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(cell)
        if (cell.model.taskState == GKDownTaskDefault) {
            [self start:indexPath];
        }else if (cell.model.taskState == GKDownTaskPause){
            [self start:indexPath];
        }else if (cell.model.taskState == GKDownTaskLoading){
            [self pause:indexPath];
        }
    }];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *deleBtn = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"取消下载" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self deletes:indexPath];
    }];
    return @[deleBtn];
}
- (void)start:(NSIndexPath *)indexPath{
    __block GKDownCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    GKDownModel * model = cell.model;
    if (model.taskState == GKDownTaskLoading) {
        return;
    }
    cell.state = GKDownTaskLoading;
    BaseDownModel *info = [BaseDownModel vcWithDownId:model.video_log_id url:model.video_url];
    [GKDownloadTask startDownTask:info progress:^(NSProgress * _Nonnull pro) {
        cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.progress = pro.fractionCompleted;
    } completion:^(NSString *path,NSError *error) {
        cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.state = path&&!error ? GKDownTaskFinish : GKDownTaskPause;
        model.path = path;
    }];
}
- (void)pause:(NSIndexPath *)indexPath{
    GKDownCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    GKDownModel *model = cell.model;
    if (model.taskState == GKDownTaskPause) {
        return;
    }
    cell.state = GKDownTaskPause;
    BaseDownModel *info = [BaseDownModel vcWithDownId:model.video_log_id url:model.video_url];
    [GKDownloadTask pauseDownTask:info];
}
- (void)deletes:(NSIndexPath *)indexPath{
    GKDownModel *model = self.listData[indexPath.row];
    BaseDownModel *info = [BaseDownModel vcWithDownId:model.video_log_id url:model.video_url];
    info.path = model.path;
    [GKDownloadTask deleteDownTask:info];
    GKDownCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.progress = 0.0f;
    cell.state = GKDownTaskDefault;
}
@end
