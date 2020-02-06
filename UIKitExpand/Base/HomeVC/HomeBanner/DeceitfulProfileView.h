#import <UIKit/UIKit.h>
typedef enum {
    DeceitfultViewPageContolAlimentRight,
    DeceitfultViewPageContolAlimentCenter
}  DeceitfultViewPageContolAliment;
typedef enum {
    DeceitfultViewPageContolStyleClassic,        
    DeceitfultViewPageContolStyleAnimated,    
    DeceitfultViewPageContolStyleNone            
}  DeceitfultViewPageContolStyle;
@class DeceitfulProfileView;
@protocol DeceitfultViewDelegate <NSObject>
@optional
- (void)cycleScrollView:(DeceitfulProfileView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;
- (void)cycleScrollView:(DeceitfulProfileView *)cycleScrollView didScrollToIndex:(NSInteger)index;
@end
@interface DeceitfulProfileView : UIView
+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame delegate:(id<DeceitfultViewDelegate>)delegate ;
@property (nonatomic, weak) id<DeceitfultViewDelegate> delegate;
@property (nonatomic, copy) NSArray *imagePathsGroup;
@property (nonatomic, copy) NSArray *arrayStringUrl;
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;
@property(nonatomic,assign) BOOL infiniteLoop;
@property(nonatomic,assign) BOOL autoScroll;
@property (nonatomic, assign) BOOL showPageControl;
@property (nonatomic, strong) UIColor *currentPageDotColor;
@property (nonatomic, strong) UIColor *pageDotColor;
@property (nonatomic, assign) DeceitfultViewPageContolAliment pageControlAliment;
@property (nonatomic, assign) DeceitfultViewPageContolStyle pageControlStyle;
+ (void)clearImagesCache;
- (void)anyhowThoroughHeating;
@end


