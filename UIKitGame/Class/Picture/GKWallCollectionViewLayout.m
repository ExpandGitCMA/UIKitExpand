#import "GKWallCollectionViewLayout.h"
@interface GKWallCollectionViewLayout()
@property (nonatomic, strong) NSMutableArray * attrsArr;
@property (nonatomic, strong) NSMutableArray *columnHeights;
@property (assign, nonatomic) CGFloat contentHeight;
@property (assign, nonatomic) NSInteger section;
@property (assign, nonatomic) NSInteger colunm;
@property (assign, nonatomic) CGFloat colunmMargin;
@property (assign, nonatomic) CGFloat rowMargin;
@property (assign, nonatomic) UIEdgeInsets inset;
@end
@implementation GKWallCollectionViewLayout
- (NSMutableArray *)attrsArr{
    if (!_attrsArr) {
        _attrsArr = [[NSMutableArray alloc] init];
    }
    return _attrsArr;
}
- (NSMutableArray *)columnHeights{
    if (!_columnHeights) {
        _columnHeights = [[NSMutableArray alloc] init];
    }
    return _columnHeights;
}
- (NSInteger)section{
    if ([self.delegate respondsToSelector:@selector(numberOfSection)]) {
        return [self.delegate numberOfSection];
    }
    return 1;
}
- (NSInteger)colunm{
    if ([self.delegate respondsToSelector:@selector(numberOfColumnInLayout:)]) {
        return [self.delegate numberOfColumnInLayout:self];
    }
    return 2;
}
- (CGFloat)columnMargin{
    if ([self.delegate respondsToSelector:@selector(columnMarginLayout:)]) {
       return [self.delegate columnMarginLayout:self];
    }
    return 10;
}
- (CGFloat)rowMargin{
    if ([self.delegate respondsToSelector:@selector(rowMarginLayout:)]) {
        return [self.delegate rowMarginLayout:self];
    }
    return 10;
}
- (UIEdgeInsets)inset{
    if ([self.delegate respondsToSelector:@selector(edgeInsetdLayout:)]) {
       return [self.delegate edgeInsetdLayout:self];
    }
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGSize)collectionViewContentSize{
    return CGSizeMake(0, self.contentHeight + self.inset.bottom);
}
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attrsArr;
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat width = self.collectionView.frame.size.width;
    CGFloat cellW = (width - self.inset.left - self.inset.right - (self.colunm - 1) * self.columnMargin) / self.colunm;
    CGFloat cellH = (SCREEN_WIDTH - 30)/2*1.4;
    if ([self.delegate respondsToSelector:@selector(wallLayout:heightForIndexPath:itemWidth:)]) {
        cellH = [self.delegate wallLayout:self heightForIndexPath:indexPath itemWidth:cellW];
    }
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columnHeights.firstObject doubleValue];
    for (int i = 1; i < self.colunm; i++) {
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    CGFloat cellX = self.inset.left + destColumn * (cellW + self.columnMargin);
    CGFloat cellY = minColumnHeight;
    if (cellY != self.inset.top) {
        cellY += self.rowMargin;
    }
    attrs.frame = CGRectMake(cellX, cellY, cellW, cellH);
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
    CGFloat maxColumnHeight = [self.columnHeights[destColumn] doubleValue];
    if (self.contentHeight < maxColumnHeight) {
        self.contentHeight = maxColumnHeight;
    }
    return attrs;
}
- (void)prepareLayout{
    [super prepareLayout];
    self.contentHeight = 0;
    [self.columnHeights removeAllObjects];
    for (NSInteger i = 0; i < self.colunm ; i ++) {
        [self.columnHeights addObject:@(self.inset.top)];
    }
    [self.attrsArr removeAllObjects];
    NSLog(@"%@",@(self.section));
    for (int section = 0; section < self.section; section++) {
        NSInteger count = [self.collectionView numberOfItemsInSection:section];
        for (int i = 0; i < count; i++) {
            NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:section];
            UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            [self.attrsArr addObject:attrs];
        }
    }
}
@end
