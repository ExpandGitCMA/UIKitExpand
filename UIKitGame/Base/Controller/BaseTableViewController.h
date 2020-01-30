#import "BaseRefreshController.h"
NS_ASSUME_NONNULL_BEGIN
@interface BaseTableViewController : BaseRefreshController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
@property (strong, nonatomic) UITableView *tableView;
@end
NS_ASSUME_NONNULL_END
