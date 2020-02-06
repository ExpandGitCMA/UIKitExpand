#import <UIKit/UIKit.h>
typedef enum {
    ZeroSDCycleViewPageContolAlimentRight,
    ZeroSDCycleViewPageContolAlimentCenter
}  ZeroSDCycleViewPageContolAliment;
typedef enum {
    ZeroSDCycleViewPageContolStyleClassic,        
    ZeroSDCycleViewPageContolStyleAnimated,    
    ZeroSDCycleViewPageContolStyleNone            
}  ZeroSDCycleViewPageContolStyle;
@class DeceitfulProfileView;
@protocol ZeroSDCycleViewDelegate <NSObject>
@optional
- (void)cycleScrollView:(DeceitfulProfileView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;
- (void)cycleScrollView:(DeceitfulProfileView *)cycleScrollView didScrollToIndex:(NSInteger)index;
@end
@interface DeceitfulProfileView : UIView
+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame delegate:(id<ZeroSDCycleViewDelegate>)delegate ;
@property (nonatomic, weak) id<ZeroSDCycleViewDelegate> delegate;
@property (nonatomic, copy) NSArray *imagePathsGroup;
@property (nonatomic, copy) NSArray *arrayStringUrl;
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;
@property(nonatomic,assign) BOOL infiniteLoop;
@property(nonatomic,assign) BOOL autoScroll;
@property (nonatomic, assign) BOOL showPageControl;
@property (nonatomic, strong) UIColor *currentPageDotColor;
@property (nonatomic, strong) UIColor *pageDotColor;
@property (nonatomic, assign) ZeroSDCycleViewPageContolAliment pageControlAliment;
@property (nonatomic, assign) ZeroSDCycleViewPageContolStyle pageControlStyle;
+ (void)clearImagesCache;
- (void)anyhowThoroughHeating;
@end

