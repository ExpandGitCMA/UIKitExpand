#import "BaseTableViewController.h"
#import "GKDownModel.h"
#import "GKVideoItem.h"
NS_ASSUME_NONNULL_BEGIN
@interface GKVideoPlayController : BaseTableViewController
+ (instancetype)vcWithPlayModel:(GKVideoModel *)model;
@end
NS_ASSUME_NONNULL_END
