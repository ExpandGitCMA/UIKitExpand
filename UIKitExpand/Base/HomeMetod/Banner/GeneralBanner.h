#import <UIKit/UIKit.h>
typedef enum {
    bannerPageContolAlimentRight,
    bannerPageContolAlimentCenter
}  bannerPageContolAliment;
typedef enum {
    bannerPageContolStyleClassic,        
    bannerPageContolStyleAnimated,    
    bannerPageContolStyleNone            
}  bannerPageContolStyle;
@class GeneralBanner;
@protocol GeneralDelegate <NSObject>
@optional
- (void)cycleScrollView:(GeneralBanner *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;
- (void)cycleScrollView:(GeneralBanner *)cycleScrollView didScrollToIndex:(NSInteger)index;
@end
@interface GeneralBanner : UIView
+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame delegate:(id<GeneralDelegate>)delegate ;
@property (nonatomic, weak) id<GeneralDelegate> delegate;
@property (nonatomic, copy) NSArray *imagePathsGroup;
@property (nonatomic, copy) NSArray *arrayStringUrl;
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;
@property(nonatomic,assign) BOOL infiniteLoop;
@property(nonatomic,assign) BOOL autoScroll;
@property (nonatomic, assign) BOOL showPageControl;
@property (nonatomic, strong) UIColor *currentPageDotColor;
@property (nonatomic, strong) UIColor *pageDotColor;
@property (nonatomic, assign) bannerPageContolAliment pageControlAliment;
@property (nonatomic, assign) bannerPageContolStyle pageControlStyle;
+ (void)clearImagesCache;
- (void)anyhowThoroughHeating;
@end
