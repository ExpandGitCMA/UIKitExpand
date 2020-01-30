#import <UIKit/UIKit.h>
#import "GKHomeModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface GKHomeItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *readCountLab;
@property (strong, nonatomic) GKHomeNewModel *model;
@end
NS_ASSUME_NONNULL_END
