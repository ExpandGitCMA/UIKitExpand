//
//  GKWallCollectionViewLayout.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/16.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GKWallCollectionViewLayout;

NS_ASSUME_NONNULL_BEGIN
@protocol GKWallLayoutDelegate <NSObject>

@required
/**
 * 每个item的高度
 */
- (CGFloat)wallLayout:(GKWallCollectionViewLayout *)layout heightForIndexPath:(NSIndexPath *)indePath itemWidth:(CGFloat)itemWidth;

@optional
/**
 * 有多少Section
 */
- (NSInteger)numberOfSection;;
/**
 * 有多少列
 */
- (NSInteger)numberOfColumnInLayout:(GKWallCollectionViewLayout *)layout;
/**
 * 每列之间的间距
 */
- (CGFloat)columnMarginLayout:(GKWallCollectionViewLayout *)layout;

/**
 * 每行之间的间距
 */
- (CGFloat)rowMarginLayout:(GKWallCollectionViewLayout *)layout;

/**
 * 每个item的内边距
 */
- (UIEdgeInsets)edgeInsetdLayout:(GKWallCollectionViewLayout *)layout;

@end

@interface GKWallCollectionViewLayout : UICollectionViewLayout
@property (nonatomic, weak) id<GKWallLayoutDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
