#import "RenewTowardPhotoView.h"
#import "TendTelescopeEager.h"
#import "ResignAboveHell.h"
#import <SDWebImage/UIImageView+WebCache.h>
NSString *const ReuseIdent = @"SDCycleCell";
NSUInteger  const SGMaxSections = 100;
@interface RenewTowardPhotoView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDataSourcePrefetching>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,weak) NSTimer *timer;
@property (nonatomic,copy) NSArray *arraySource;
@end
@implementation RenewTowardPhotoView
+(instancetype)cycleScrollViewWithFrame:(CGRect)frame delegate:(id<ZeroSDCycleViewDelegate>)delegate {
    RenewTowardPhotoView *cycleScrollView = [[self alloc] initWithFrame:frame];
    cycleScrollView.delegate = delegate;
    return cycleScrollView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self collectionView];
        [self pageControl];
    }
    return self;
}
-(UICollectionView*)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = self.frame.size;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.scrollsToTop = NO;
        [_collectionView setPrefetchingEnabled:NO];
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[TendTelescopeEager class] forCellWithReuseIdentifier:ReuseIdent];
        [self addSubview:_collectionView];
    }
    return _collectionView;
}
- (void)collectionView:(UICollectionView *)collectionView prefetchItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
}
- (void)collectionView:(UICollectionView *)collectionView cancelPrefetchingForItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths  {
}
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TendTelescopeEager*cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdent forIndexPath:indexPath];
    NSString*url =  [_arraySource SafetyObjectAtIndex:indexPath.item];
    [cell disguiseTheseTheory:url];
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger  imageCount  ;
    if (self.arraySource.count==0) {
        imageCount = 1;
    }else{
        imageCount = _arraySource.count;
    }
    return  imageCount;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return SGMaxSections;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(cycleScrollView:didSelectItemAtIndex:)]) {
        [self.delegate cycleScrollView:self didSelectItemAtIndex:indexPath.item % self.arraySource.count];
    }
}
-(UIPageControl*)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.currentPage = 0;
        _pageControl.enabled = NO;
        [_pageControl  sizeToFit];
        [self addSubview:_pageControl];
    }
    return _pageControl;
}
-(void)setPageControlAliment:(ZeroSDCycleViewPageContolAliment)pageControlAliment{
    _pageControlAliment = pageControlAliment;
    switch (_pageControlAliment) {
        case ZeroSDCycleViewPageContolAlimentRight:{
             _pageControl.frame = CGRectMake(self.frame.size.width-120, self.frame.size.height-30, 30, 30);
        }
            break;
        case ZeroSDCycleViewPageContolAlimentCenter:{
                _pageControl.frame = CGRectMake(0, self.frame.size.height-30, self.frame.size.width, 30);
        }
            break;
        default:
            break;
    }
}
-(void)setPageControlStyle:(ZeroSDCycleViewPageContolStyle)pageControlStyle{
        _pageControlStyle = pageControlStyle;
    switch (_pageControlStyle) {
        case ZeroSDCycleViewPageContolStyleClassic:{
              _pageControl.pageIndicatorTintColor=[UIColor whiteColor];
            _pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
        }
            break;
        case ZeroSDCycleViewPageContolStyleAnimated:{
            [_pageControl  setValue:[UIImage imageNamed:@"img_home_banner_select"] forKeyPath:@"currentPageImage"];
            [_pageControl setValue:[UIImage imageNamed:@"img_home_banner_unselect"] forKeyPath:@"pageImage"];
        }
            break;
        case ZeroSDCycleViewPageContolStyleNone:{
            _pageControl.hidden = YES;
        }
            break;
        default:
            break;
    }
}
-(void)scrollLoop{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:_autoScrollTimeInterval target:self selector:@selector(nextpages) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer ;
}
-(void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}
-(void)nextpages{
    if (_arraySource.count == 0) return;
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    NSIndexPath *resetCurrentIndexPath = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:SGMaxSections / 2];
    [self.collectionView scrollToItemAtIndexPath:resetCurrentIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    NSInteger nextItem = resetCurrentIndexPath.item + 1;
    NSInteger nextSection = resetCurrentIndexPath.section;
    if (nextItem == _arraySource.count) {
        nextItem = 0;
        nextSection++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
-(void)setImagePathsGroup:(NSArray *)imagePathsGroup{
       _imagePathsGroup = imagePathsGroup;
      _arraySource =  [imagePathsGroup copy];
      [self reloadStatus];
}
-(void)setArrayStringUrl:(NSArray *)arrayStringUrl{
    _arrayStringUrl = arrayStringUrl;
    NSMutableArray *temp = [NSMutableArray new];
    [_arrayStringUrl enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * stop) {
        NSString *urlString;
        if ([obj isKindOfClass:[NSString class]]) {
            urlString = obj;
        } else if ([obj isKindOfClass:[NSURL class]]) {
            NSURL *url = (NSURL *)obj;
            urlString = [url absoluteString];
        }
        if (urlString) {
            [temp addObject:urlString];
        }
    }];
    self.arraySource = [temp copy];
    [self reloadStatus];
}
-(void)setAutoScrollTimeInterval:(CGFloat)autoScrollTimeInterval{
    _autoScrollTimeInterval = autoScrollTimeInterval;
}
-(void)setAutoScroll:(BOOL)autoScroll{
    _autoScroll = autoScroll;
    if (_autoScroll ) {
        [self scrollLoop];
    }
}
-(void)setShowPageControl:(BOOL)showPageControl{
    _showPageControl = showPageControl;
    _pageControl.hidden = !showPageControl;
}
- (void)setCurrentPageDotColor:(UIColor *)currentPageDotColor
{
    _currentPageDotColor = currentPageDotColor;
    _pageControl.currentPageIndicatorTintColor = _currentPageDotColor;
}
-(void)setPageDotColor:(UIColor *)pageDotColor{
    _pageDotColor = pageDotColor;
    _pageControl.pageIndicatorTintColor = _pageDotColor;
}
-(void)reloadStatus{
    _pageControl.numberOfPages= _arraySource.count;
    if (_arraySource.count) {
        [self setAutoScroll:YES];
    }
    [_collectionView reloadData];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
      if (!self.arraySource.count) return; 
     int indexPageControl = (int) (scrollView.contentOffset.x/scrollView.bounds.size.width)%(_arraySource.count );
    _pageControl.currentPage = indexPageControl;
    if ([self.delegate respondsToSelector:@selector(cycleScrollView:didScrollToIndex:)]) {
        [self.delegate cycleScrollView:self didScrollToIndex:indexPageControl];
    }
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (!self.arraySource.count) return; 
    int indexPageControl = (int) (scrollView.contentOffset.x/scrollView.bounds.size.width)%(_arraySource.count );
    if ([self.delegate respondsToSelector:@selector(cycleScrollView:didScrollToIndex:)]) {
        [self.delegate cycleScrollView:self didScrollToIndex:indexPageControl];
    }
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (_autoScroll) {
           [self removeTimer];
    }
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (_autoScroll ) {
        [self scrollLoop];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self defaultSelectedScetion];
}
- (void)defaultSelectedScetion {
    if (self.arraySource.count == 0||self.arraySource.count==1) return;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
}
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (!newSuperview) {
        [self removeTimer];
        [self freeCollectionView];
    }
}
- (void)freeCollectionView{
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
}
- (void)compressPunishmentAcademic
{
    [[self class] clearImagesCache];
}
+ (void)clearImagesCache
{
    [[[SDWebImageManager sharedManager] imageCache] clearDisk];
}
@end
