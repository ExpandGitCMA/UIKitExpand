//
//  GKHomeBannerView.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/15.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKHomeBannerView.h"
#import "SDCycleScrollView.h"

@interface GKHomeBannerView()<SDCycleScrollViewDelegate>
@property (strong, nonatomic) SDCycleScrollView *carouselView;
@end

@implementation GKHomeBannerView
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.carouselView];
        [self.carouselView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.carouselView.superview);
        }];
    }
    return self;
}
- (SDCycleScrollView *)carouselView
{
    if (!_carouselView) {
        CGFloat height = SCREEN_WIDTH/640*268.0f;
        _carouselView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0, SCREEN_WIDTH, height) delegate:self placeholderImage:placeholder];
        _carouselView.backgroundColor = [UIColor colorWithRGB:0xf8f8f8];
        _carouselView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _carouselView.autoScrollTimeInterval  = 5.0f;
        _carouselView.delegate = self;
        
    }
    return _carouselView;
}
- (void)setListData:(NSArray *)listData{
    _listData = listData;
    NSMutableArray *datas = [[NSMutableArray alloc] init];
    [listData enumerateObjectsUsingBlock:^(GKHeadItem*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [datas addObject:obj.litpic ?:@""];
    }];
    self.carouselView.imageURLStringsGroup = datas.copy;
}
@end
