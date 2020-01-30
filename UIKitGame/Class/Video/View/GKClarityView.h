#import "BaseTableView.h"
#import "GKVideoItem.h"
NS_ASSUME_NONNULL_BEGIN
@class GKClarityView;
@protocol GKClarityViewDelegate<NSObject>
@optional
- (void)clarityView:(GKClarityView *)player item:(GKVideoStreams *)item;
@end
@interface GKClarityView : BaseTableView
@property (assign, nonatomic) id<GKClarityViewDelegate>delegate;
@property (strong, nonatomic) NSArray <GKVideoStreams *>*items;
@property (strong, nonatomic) GKVideoStreams *playItem;
@end
NS_ASSUME_NONNULL_END
