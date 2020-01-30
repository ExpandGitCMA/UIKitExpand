#import "BaseViewController.h"
#import <MJRefresh/MJRefresh.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import <YYKit.h>
#import <KVOController.h>
typedef NS_ENUM(NSUInteger, ATRefreshOption) {
    ATRefreshNone = 0,
    ATHeaderRefresh = 1 << 0,
    ATFooterRefresh = 1 << 1,
    ATHeaderAutoRefresh = 1 << 2,
    ATFooterAutoRefresh = 1 << 3,
    ATFooterDefaultHidden = 1 << 4,
    ATRefreshDefault = (ATHeaderRefresh | ATHeaderAutoRefresh | ATFooterRefresh | ATFooterDefaultHidden),
};
static NSString *FDMSG_Home_DataRefresh                      = @"数据加载中...";
static NSString *FDMSG_Home_DataEmpty                        = @"数据空空如也...";
static NSString *FDNoNetworkMsg                              = @"无网络连接,请检查网络设置";
@interface BaseRefreshController : BaseViewController <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic, assign, readonly) NSInteger currentPage;
@property (nonatomic, assign, readonly) BOOL isRefreshing;
@property (nonatomic, assign, readonly) BOOL reachable;
- (void)setupRefresh:(UIScrollView *)scrollView option:(ATRefreshOption)option;
- (void)setupEmpty:(UIScrollView *)scrollView image:(UIImage *)image title:(NSString *)title;
- (void)setupEmpty:(UIScrollView *)scrollView;
- (void)refreshData:(NSInteger)page;
- (void)endRefresh:(BOOL)hasMore;
- (void)endRefreshNeedHidden:(BOOL)hasMore;
- (void)endRefreshFailure;
- (void)headerRefreshing NS_REQUIRES_SUPER;
- (void)footerRefreshing NS_REQUIRES_SUPER;
- (void)scroolToTopBeginRefresh;
@end
