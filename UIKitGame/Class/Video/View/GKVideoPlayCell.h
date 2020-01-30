#import <UIKit/UIKit.h>
#import "GKDownModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface GKVideoPlayCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLab;
@property (strong, nonatomic) GKDownModel *model;
@end
NS_ASSUME_NONNULL_END
