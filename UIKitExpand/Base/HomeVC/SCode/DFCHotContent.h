#import <UIKit/UIKit.h>
@class DFCHotContent;
@protocol  HotContentDelegate <NSObject>
@optional
-(void)selectStatus:(DFCHotContent*)selectStatus  page:(NSInteger)page;
@end
@interface DFCHotContent : UIView
@property(nonatomic,weak) id<HotContentDelegate> delegate;
-(instancetype)initWithFrame:(CGRect)frame HotSearch:(NSArray*)hotSearch;
@end
