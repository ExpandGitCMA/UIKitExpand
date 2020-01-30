//
//  GKWallCollectionViewLayout.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/16.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKWallCollectionViewLayout.h"
@interface GKWallCollectionViewLayout()
/** 存放所有的布局属性 */
@property (nonatomic, strong) NSMutableArray * attrsArr;
/** 存放所有列的当前高度 */
@property (nonatomic, strong) NSMutableArray *columnHeights;
/** 内容的高度 */
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
/**
 * 返回indexPath位置cell对应的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    // 创建布局属性
    UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //collectionView的宽度
    CGFloat width = self.collectionView.frame.size.width;
    CGFloat cellW = (width - self.inset.left - self.inset.right - (self.colunm - 1) * self.columnMargin) / self.colunm;
    CGFloat cellH = (SCREEN_WIDTH - 30)/2*1.4;
    if ([self.delegate respondsToSelector:@selector(wallLayout:heightForIndexPath:itemWidth:)]) {
        cellH = [self.delegate wallLayout:self heightForIndexPath:indexPath itemWidth:cellW];
    }
    // 找出最短的那一列
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columnHeights.firstObject doubleValue];
    for (int i = 1; i < self.colunm; i++) {
        // 取得第i列的高度
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
    
    // 更新最短那一列的高度
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
    
    // 记录内容的高度 - 即最长那一列的高度
    CGFloat maxColumnHeight = [self.columnHeights[destColumn] doubleValue];
    if (self.contentHeight < maxColumnHeight) {
        self.contentHeight = maxColumnHeight;
    }
    
    return attrs;
}
- (void)prepareLayout{
    
    [super prepareLayout];
    self.contentHeight = 0;
    // 清楚之前计算的所有高度
    [self.columnHeights removeAllObjects];
    // 设置每一列默认的高度
    for (NSInteger i = 0; i < self.colunm ; i ++) {
        [self.columnHeights addObject:@(self.inset.top)];
    }
    // 清楚之前所有的布局属性
    [self.attrsArr removeAllObjects];
    // 开始创建每一个cell对应的布局属性
    NSLog(@"%@",@(self.section));
    for (int section = 0; section < self.section; section++) {
        NSInteger count = [self.collectionView numberOfItemsInSection:section];
        for (int i = 0; i < count; i++) {
            // 创建位置
            NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:section];
            // 获取indexPath位置上cell对应的布局属性
            UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            [self.attrsArr addObject:attrs];
        }
    }
}
@end
