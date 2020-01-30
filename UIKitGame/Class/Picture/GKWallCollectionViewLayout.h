#import <UIKit/UIKit.h>
@class GKWallCollectionViewLayout;
NS_ASSUME_NONNULL_BEGIN
@protocol GKWallLayoutDelegate <NSObject>
@required
- (CGFloat)wallLayout:(GKWallCollectionViewLayout *)layout heightForIndexPath:(NSIndexPath *)indePath itemWidth:(CGFloat)itemWidth;
@optional
- (NSInteger)numberOfSection;;
- (NSInteger)numberOfColumnInLayout:(GKWallCollectionViewLayout *)layout;
- (CGFloat)columnMarginLayout:(GKWallCollectionViewLayout *)layout;
- (CGFloat)rowMarginLayout:(GKWallCollectionViewLayout *)layout;
- (UIEdgeInsets)edgeInsetdLayout:(GKWallCollectionViewLayout *)layout;
@end
@interface GKWallCollectionViewLayout : UICollectionViewLayout
@property (nonatomic, weak) id<GKWallLayoutDelegate>delegate;
@end
NS_ASSUME_NONNULL_END
