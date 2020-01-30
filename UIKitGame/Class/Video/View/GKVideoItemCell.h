#import <UIKit/UIKit.h>
#import "GKVideoItem.h"
NS_ASSUME_NONNULL_BEGIN
@interface GKVideoItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *totalLab;
@property (strong, nonatomic)GKItemModel *model;
@end
NS_ASSUME_NONNULL_END
