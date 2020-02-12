#import "YaBoHomeVC.h"
#import "BackwardTallWreck.h"
#import "YaBoRemoteVC.h"
#import "YaBoCodeVC.h"
#import "PlanLogic.h"
#import "NewsPlayBallCell.h"
#import "YoBoBallCell.h"
#import "YoBoNews.h"
#import "NewsSportModel.h"
#import "Leagstus.h"
#import "LeagstusCell.h"
#import "YoBoUpNews.h"
#import "FJPreImageView.h"
@interface YaBoHomeVC ()
@property(nonatomic,strong)YoBoUpNews*upView;
@property (nonatomic, assign) BOOL upValue;
@end
@implementation YaBoHomeVC


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUIView];
}


-(void)initUIView{
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsPlayBallCell" bundle:nil] forCellReuseIdentifier:@"PlayBallCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"YoBoBallCell" bundle:nil] forCellReuseIdentifier:@"BallCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"YoBoNews" bundle:nil] forCellReuseIdentifier:@"SportCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LeagstusCell" bundle:nil] forCellReuseIdentifier:@"LeagstusCell"];
    [self getHomeBanner];
}
-(void)getHomeBanner{
    [[FeelLeatherManager sharedManager]tryHeapUseful:URL_HomeSports params:@{} completed:^(BOOL ret, id obj) {
        if (ret) {
            NSArray *banner = [obj objectForKey:@"banner"];
            self.tableView.tableHeaderView =  [self zeroSDCycleView];
            [self.zeroSDCycleView setArrayStringUrl:banner];
        }
    }];
}

-(void)cycleScrollView:(ReuniteDifficultyWalletView *)cycleScrollView didSelectItemAtIndex:(NSArray*)index{
    
     FJPreImageView * imageVc = [[FJPreImageView alloc]init];
             
       [imageVc setLongTapPressBlock:^(UIImage * _Nonnull image) {
                
      }];
      [imageVc showPreView:[UIApplication sharedApplication].keyWindow urls:index index:0];
}


- (void)getMassage{
    NSMutableArray*data = [[NSMutableArray alloc]init];
    [[FeelLeatherManager sharedManager] requestWithLocalFileWithName:@"date" completed:^(BOOL ret, id obj) {
         NSArray *arr = [NSArray arrayWithArray:[obj objectForKey:@"data"]];
        for (NSDictionary *dic in arr) {
           NewsModel *model = [NewsModel setModelWithDictionary:dic];
           [data addObject: model];
        }
        NSArray *content = [NSArray arrayWithArray:[obj objectForKey:@"content"]];
               for (NSDictionary *dic in content) {
                  NewsSportModel *model = [NewsSportModel setModelWithDictionary:dic];
            [data addObject: model];
        }
       NSArray *leagstus = [obj objectForKey:@"Leagstus"];
        for (NSDictionary *dic in leagstus) {
               Leagstus *model = [Leagstus setModelWithDictionary:dic];
               [data addObject: model];
        }
    }];
    self.upValue = YES;
    self.dataSource = [self getRandomArrFrome:[data copy]];
     dispatch_async(dispatch_get_main_queue(), ^{
                 [[self zeroSDCycleView]  setPageControlStyle:ZeroSDCycleViewPageContolStyleClassic];
                [self.tableView.mj_header endRefreshing];
                [self.tableView.mj_footer endRefreshing];
                [self.tableView reloadData];
                [self starAnimationWithTableView:self.tableView];
     });
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell*tableViewCell;
   id obj = self.dataSource[indexPath.row];
    if ([obj isKindOfClass:[ BackwardTallWreck class]]) {
         YoBoBallCell*cell = [tableView dequeueReusableCellWithIdentifier:@"BallCell" forIndexPath:indexPath];
        BackwardTallWreck *model = self.dataSource[indexPath.row];
        cell.title.text = model.title;
        cell.timer .text = model.pubtime;
        tableViewCell = cell;
     }else if ([obj isKindOfClass:[ NewsModel class]]){
       NewsPlayBallCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayBallCell" forIndexPath:indexPath];
        NewsModel *model = self.dataSource [indexPath.row];
        cell.title.text = model.title;
        cell.timer .text = model.time;
         [cell.image  sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"https://n.sinaimg.cn",model.image]] placeholderImage:[UIImage imageNamed:@"icon_data_empty"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
             if (!error&&image) {
                    cell.image.contentMode =  UIViewContentModeScaleAspectFill;
             }else{
                  cell.image.contentMode = UIViewContentModeCenter;
             }
            }];
         tableViewCell = cell;
     }else if ([obj isKindOfClass:[NewsSportModel class]]){
           YoBoNews *cell = [tableView dequeueReusableCellWithIdentifier:@"SportCell" forIndexPath:indexPath];
            NewsSportModel *model = self.dataSource [indexPath.row];
            cell.title.text = model.title;
            cell.content.text = model.time;
            [cell.image setImage:[UIImage imageNamed:model.image]];
            tableViewCell = cell;
     }else if ([obj isKindOfClass:[Leagstus class]]){
            LeagstusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeagstusCell" forIndexPath:indexPath];
            Leagstus *model = self.dataSource [indexPath.row];
            cell.content.text = model.title;
            [cell.imageUrl  sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"icon_data_empty"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (!error&&image) {
                       cell.imageUrl.contentMode =  UIViewContentModeScaleAspectFill;
                }else{
                        cell.imageUrl.contentMode = UIViewContentModeCenter;
                }
                    }];
            tableViewCell = cell;
     }
    tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableViewCell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return self.dataSource.count;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView{
   return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (_upValue) {
         return 150;
     }
     return 0;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [self upView];
}

-(YoBoUpNews*)upView{
    if (!_upView) {
        _upView = [[YoBoUpNews alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    }
    return _upView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 id obj = self.dataSource[indexPath.row];
    if ([obj isKindOfClass:[ BackwardTallWreck class]]) {
         BackwardTallWreck *model = self.dataSource [indexPath.row];
         CGFloat defutHeight = 38;
        return defutHeight+[self tableViewForRowAtIndexCellHeight:model.title];
    }else if ([obj isKindOfClass:[ NewsModel class]]){
        NewsModel *model = self.dataSource [indexPath.row];
        CGFloat defutHeight = 195;
        return defutHeight+[self tableViewForRowAtIndexCellHeight:model.title];
    }else if ([obj isKindOfClass:[NewsSportModel class]]){
        CGFloat defutHeight = 125;
        return defutHeight;
    }else if ([obj isKindOfClass:[Leagstus class]]){
        CGFloat defutHeight = 205;
        Leagstus *model = self.dataSource [indexPath.row];
        return defutHeight+[self tableViewForRowAtIndexCellHeight:model.content];
    }
        return 70;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YaBoRemoteVC * homeDetailVC = [[YaBoRemoteVC alloc] init];
    homeDetailVC.hidesBottomBarWhenPushed = YES;
   id obj = self.dataSource[indexPath.row];
  if ([obj isKindOfClass:[ BackwardTallWreck class]]) {
         BackwardTallWreck *model = self.dataSource [indexPath.row];
          homeDetailVC.conten = [NSString stringWithFormat:@"%@%@%@%@",model.pubtime,@"\n",model.modtime_desc,model.title];
         }else if ([obj isKindOfClass:[ NewsModel class]]){
            NewsModel *model = self.dataSource [indexPath.row];
              homeDetailVC.conten = [NSString stringWithFormat:@"%@%@%@",model.time,@"\n",model.content];
         if([model.image isNull]){
              homeDetailVC.url =  [NSString stringWithFormat:@"%@%@",@"https://n.sinaimg.cn",model.image];
           }else{
             homeDetailVC.image = @"news_empty";
            }
        }else if ([obj isKindOfClass:[NewsSportModel class]]){
            NewsSportModel *model = self.dataSource [indexPath.row];
            homeDetailVC.conten = [NSString stringWithFormat:@"%@%@%@",model.title,@"\n",model.content];
            homeDetailVC.image = model.image;
          }else if ([obj isKindOfClass:[Leagstus class]]){
                Leagstus *model = self.dataSource [indexPath.row];
                homeDetailVC.url = model.image;
                homeDetailVC.conten = [NSString stringWithFormat:@"%@%@%@",model.content,@"\n \n",model.name];
            }
     [self.navigationController pushViewController:homeDetailVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
