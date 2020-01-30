#import "BaseRefreshController.h"
NS_ASSUME_NONNULL_BEGIN
@interface BaseConnectionController : BaseRefreshController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
}
@property (strong, nonatomic)UICollectionView * collectionView;
@end
NS_ASSUME_NONNULL_END
