#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface LeagstusCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIImageView *imageUrl;
@end
NS_ASSUME_NONNULL_END