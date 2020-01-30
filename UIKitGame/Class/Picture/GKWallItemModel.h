#import "BaseModel.h"
#import "ATBrowserProtocol.h"
NS_ASSUME_NONNULL_BEGIN
@interface GKWallItemModel : BaseModel<ATBrowserProtocol>
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *url;
@property (strong, nonatomic) UIImage *image;
@end
NS_ASSUME_NONNULL_END
