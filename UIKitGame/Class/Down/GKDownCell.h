#import <UIKit/UIKit.h>
#import "GKDownModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface GKDownCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *totalLab;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIButton *downBtn;
@property (strong, nonatomic)GKDownModel *model;
@property (assign, nonatomic)GKDownTaskState state;
@property (assign, nonatomic)CGFloat progress;
@end
NS_ASSUME_NONNULL_END
