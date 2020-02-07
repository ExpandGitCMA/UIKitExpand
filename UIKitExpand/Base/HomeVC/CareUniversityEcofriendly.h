#import <UIKit/UIKit.h>
#import "VomitTime.h"
NS_ASSUME_NONNULL_BEGIN
@interface CareUniversityEcofriendly : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *timer;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) NewsModel *model ;
@end
NS_ASSUME_NONNULL_END
