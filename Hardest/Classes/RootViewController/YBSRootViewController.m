#import "YBSRootViewController.h"
#import <JhtMarquee/JhtHorizontalMarquee.h>
#import "YBSYBSportsRequest.h"

@interface YBSRootViewController ()
@property (nonatomic, strong)JhtHorizontalMarquee *horizontalMarquee;

@end

@implementation YBSRootViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    [self getRequestData ];
}


-(void)getRequestData{
        
    NSMutableArray*dataSouce = [NSMutableArray new];
    [[YBSYBSportsRequest sharedManager]getWithPath:URL_YBSports_System dict:@{} completed:^(BOOL ret, id  _Nonnull obj) {
       
        DEBUG_NSLog(@" obj %@", obj );
        if (ret) {
           
               NSArray*data= [(NSDictionary*)obj objectForKey:@"data"];
                   BOOL vanue = [[(NSDictionary*)obj objectForKey:@"vanue"] boolValue];
            
                   [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                          [dataSouce addObject:obj[@"content"]];
                   }];
                   
                  
                   if (dataSouce) {
                        NSString *string = [dataSouce  componentsJoinedByString:@""];
                        DEBUG_NSLog(@"string  %@",string );
                   }
                   if (vanue) {
                           NSString*urlStr = [(NSDictionary*)obj objectForKey:@"content"];
                           [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
                   }
        }

    }];
     self.horizontalMarquee.text = @" 今日推荐开心好玩游戏  开心挠脚小游戏 开心划拳小游戏 小伙伴们快来参与吧,参与天天小游戏,每日好礼送不停！！ 天天参与,天天有奖小游戏！";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

//    // 开启跑马灯
    [_horizontalMarquee marqueeOfSettingWithState:MarqueeStart_H];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 关闭跑马灯
    [_horizontalMarquee marqueeOfSettingWithState:MarqueeShutDown_H];
}


- (JhtHorizontalMarquee *)horizontalMarquee {
    if (!_horizontalMarquee) {
        _horizontalMarquee = [[JhtHorizontalMarquee alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44) singleScrollDuration:0.0];
       _horizontalMarquee.textColor = [UIColor whiteColor];
      [self.view addSubview:_horizontalMarquee];
    }
    return _horizontalMarquee;
}

- (IBAction)home:(UIButton *)sender {
     [self performSegueWithIdentifier:@"Rare" sender:nil];
}
- (IBAction)play:(UIButton *)sender {
       [self performSegueWithIdentifier:@"PlayGame" sender:nil];
}
- (IBAction)set:(UIButton *)sender {
    [self performSegueWithIdentifier:@"Setting" sender:nil];
}

-(void)loadDatespl{

}
@end
