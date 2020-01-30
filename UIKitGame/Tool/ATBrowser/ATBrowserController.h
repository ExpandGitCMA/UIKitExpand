#import <UIKit/UIKit.h>
#import "ATBrowserModel.h"
#import "ATBrowserProtocol.h"
NS_ASSUME_NONNULL_BEGIN
@interface ATBrowserController : BaseViewController
+ (instancetype)vcWithDatas:(NSArray *)listData selectIndex:(NSInteger)index;
@end
NS_ASSUME_NONNULL_END
