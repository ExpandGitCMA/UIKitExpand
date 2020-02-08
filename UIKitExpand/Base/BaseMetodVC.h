#import <UIKit/UIKit.h>
#import "SportsBallFile.h"
#import "SportsColorHeader.h"
#import "ShineOpeningTechnician.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import "MJRefresh.h"
#import "GeneralBanner.h"
#import "TableViewAnimationKitHeaders.h"
#import "HttpNetWorkManager.h"
#import "Safety.h"
#import "NSString+IMAdditions.h"
#import "CJWRefreshHeader.h"
#import "CJWRefreshFooter.h"


@interface BaseMetodVC : UIViewController<UITableViewDelegate, UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate,GeneralDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataSource;
@property(nonatomic,strong)GeneralBanner *banner;
- (void)simplyTallWidth;
-(NSMutableArray*)getRandomArrFrome:(NSArray*)arr;
-(CGFloat)tableViewForRowAtIndexCellHeight:(NSString *)title;
- (void)consistViaSky:(UITableView *)tableView;
@end
