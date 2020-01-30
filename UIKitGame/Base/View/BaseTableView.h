#import "BaseView.h"
@interface BaseTableView : BaseView<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_tableView;
}
@property (strong, nonatomic) UITableView * tableView;
@end
