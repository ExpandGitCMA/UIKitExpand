#import <UIKit/UIKit.h>
#import "AppHeaderFile.h"
#import "AppColorHeader.h"
#import "CrossAnalysisAccidental.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import "MJRefresh.h"
#import "ReuniteDifficultyWalletView.h"
#import "TableViewAnimationKitHeaders.h"
#import "FeelLeatherManager.h"
#import "FavourStrip.h"
#import "ToolsAuthorization.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSString+IMAdditions.h"
@interface TendOutsideObjectionController : UIViewController<UITableViewDelegate, UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate,ZeroSDCycleViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataSource;
@property(nonatomic,strong)ReuniteDifficultyWalletView *zeroSDCycleView;
- (void)getMassage;
-(NSMutableArray*)getRandomArrFrome:(NSArray*)arr;
-(CGFloat)tableViewForRowAtIndexCellHeight:(NSString *)title;
- (void)starAnimationWithTableView:(UITableView *)tableView;
@end
