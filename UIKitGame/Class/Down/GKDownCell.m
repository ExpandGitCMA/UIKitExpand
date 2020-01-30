#import "GKDownCell.h"
@implementation GKDownCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.downBtn.layer.masksToBounds = YES;
    self.downBtn.layer.cornerRadius = AppRadius;
}
- (void)setModel:(GKDownModel *)model{
    if (_model != model) {
        _model = model;
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.thumbnail_url]];
        self.titleLab.text = model.title ?:@"";
        self.timeLab.text = [GKTimeTool timeStampTurnToDate:model.create_time.longLongValue];
        self.totalLab.text = [GKTimeTool timeStampTurnToTimes:model.video_length.longLongValue];
    }
    self.progress = model.progress;
    [self setUI];
}
- (void)setProgress:(CGFloat)progress{
    if (_progress != progress) {
        _progress = progress;
    }
    self.model.progress = progress;
    self.progressView.progress = progress;
}
- (void)setState:(GKDownTaskState)state{
    if (_state != state) {
        _state = state;
    }
    self.model.taskState = state;
    [self setUI];
}
- (void)setUI{
    NSString *title = @"下载";
    switch (self.model.taskState) {
        case GKDownTaskDefault:
            title = @"下载";
            break;
        case GKDownTaskPause:
            title =@"暂停";
            break;
        case GKDownTaskLoading:
            title =@"下载中";
            break;
        case GKDownTaskFinish:
            title = @"下载完成";
            break;
        default:
            break;
    }
    self.downBtn.userInteractionEnabled = !(self.model.taskState == GKDownTaskFinish);
    [self.downBtn setTitle:title forState:UIControlStateNormal];
}
@end
