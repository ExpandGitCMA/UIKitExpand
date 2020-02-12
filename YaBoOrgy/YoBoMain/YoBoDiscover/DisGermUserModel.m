#import "DisGermUserModel.h"
#import "YoBoDisModel.h"
#import "YoBoGermTools.h"


static DisGermUserModel * _tool = nil;
@interface DisGermUserModel ()
@property (nonatomic,strong)NSMutableArray * BillCacheArr;
@property (nonatomic,strong)NSMutableArray * cacheArr;
@property (nonatomic,strong)NSMutableArray * imageDataArr;
@property (nonatomic,strong)NSMutableArray * headImageArr;
@property (nonatomic,strong)NSMutableArray * holidayArr;
@property (nonatomic,strong)NSMutableArray * admissionArr;
@end



@implementation DisGermUserModel

+(instancetype)shared{
    if (_tool == nil) {
        _tool = [[DisGermUserModel alloc] init];
    }
     return _tool;
}


-(NSString *)IMGToBase64Str:(UIImage *) image
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}


- (void)initUserModel:(NSString *)model{
    if ([self isFirstShow:model]) {
        NSArray * arrImage = @[@"februaryNiao",@"februaryAiao",@"februaryBiao",@"februaryQiao",@"februaRtsQiao"];
        for (NSInteger i = 0; i < arrImage.count; i++) {
            UIImage * image = [UIImage imageNamed:arrImage[i]];
            NSString * imageDataStr = [self IMGToBase64Str:image];
            [self.imageDataArr addObject:imageDataStr];
        }
        NSArray * headImageArr = @[@"Icon1",@"Icon2",@"Icon3",@"Icon4",@"Icon5"];
        for (NSInteger i = 0; i < headImageArr.count; i++) {
            UIImage * image = [UIImage imageNamed:headImageArr[i]];
            NSString * imageDataStr = [self IMGToBase64Str:image];
            [self.headImageArr addObject:imageDataStr];
        }
        
        
        NSArray * arr = @[
            @{
                   @"imageStr":self.imageDataArr[2],
                   @"news":@"坚持就会有效果,加油我们是最优秀的一群人,我们是一群热爱足球的人，努力奔跑永不言弃！",
                   @"timer":@"2019-12-6",
                   @"token":@"3",
                   @"liker":@"19",
                  @"collect":@"45",
                  @"name":@"雷佳彗-吃货",
                  @"ImageUrls":@"",
                  @"ImageUrl":@"",
                  @"headimage":self.headImageArr[2]
                   
            },
           
        @{
             @"imageStr":self.imageDataArr[3],
             @"news":@"孩子们今天真开心,这场开心的踢球",
             @"timer":@"2019-12-12",
             @"token":@"2",
             @"liker":@"9",
             @"collect":@"22",
             @"name":@"石头的妈妈,爱你",
             @"ImageUrls":[self IMGToBase64Str:[UIImage imageNamed:@"febasodfjhasuarhs"]],
               @"ImageUrl":[self IMGToBase64Str:[UIImage imageNamed:@"febasodfjerwearhs"]],
             @"headimage":self.headImageArr[1]
             
        },
        @{
              @"imageStr":self.imageDataArr[4],
              @"news":@"周末踢球活动真开心😄",
              @"timer":@"2019-12-10",
              @"token":@"3",
              @"liker":@"22",
              @"collect":@"31",
             @"name":@"喵神多多",
             @"ImageUrls":@"",
             @"ImageUrl":@"",
             @"headimage":self.headImageArr[4],
           },
                          
    @{
        @"imageStr":self.imageDataArr[1],
        @"news":@"有甜有咸有咸,挥汗如雨的下午时光",
        @"timer":@"2019-2-6",
        @"token":@"4",
        @"liker":@"12",
        @"collect":@"66",
        @"name":@"朱莉莉莉的甜甜",
        @"ImageUrls":@"",
        @"ImageUrl":@"",
        @"headimage":self.headImageArr[3]
        
    },
     @{
            @"imageStr":self.imageDataArr[0],
            @"news":@"周末带孩子去足球公园踢下足球",
            @"timer":@"2020-01-03",
            @"token":@"1",
            @"liker":@"56",
            @"collect":@"12",
            @"name":@"阿狸说话到心坎里了",
            @"ImageUrls":[self IMGToBase64Str:[UIImage imageNamed:@"februarytyoiahs"]],
            @"ImageUrl":[self IMGToBase64Str:[UIImage imageNamed:@"febfgsuarhs"]],
           @"headimage":self.headImageArr[0]
         },
      
];
      
        
        for (NSDictionary * dic in arr) {
            YoBoDisModel * model = [[YoBoDisModel alloc] init];
            model.imageStr = dic[@"imageStr"];
            model.imageUrls= dic[@"ImageUrls"];
            model.imageUrl = dic[@"ImageUrl"];
            model.timer = dic[@"timer"];
            model.token = dic[@"token"];
            model.news = dic[@"news"];
            model.liker = dic[@"liker"];
            model.collect = dic[@"collect"];
            model.name = dic[@"name"];
            model.headimage = dic[@"headimage"];
            [self.cacheArr addObject:model];
        }
        [[YoBoGermTools toolsShareManer] saveObjects:self.cacheArr];
    }
    
}

-(BOOL)isFirstShow:(NSString *)str{
    NSUserDefaults * Faults = [NSUserDefaults standardUserDefaults];
    if ([Faults objectForKey:str]) {
        return NO;
    }else{
        [Faults setBool:YES forKey:str];
        return YES;
    }
}


- (NSMutableArray *)BillCacheArr{
    if (!_BillCacheArr) {
        _BillCacheArr = [[NSMutableArray alloc] init];
    }
    return _BillCacheArr;
}

- (NSMutableArray *)cacheArr{
    if (!_cacheArr) {
        _cacheArr = [[NSMutableArray alloc] init];
    }
    return _cacheArr;
}

- (NSMutableArray *)imageDataArr{
    if (!_imageDataArr) {
        _imageDataArr = [[NSMutableArray alloc] init];
    }
    return _imageDataArr;
}

- (NSMutableArray *)headImageArr{
    if (!_headImageArr) {
        _headImageArr = [[NSMutableArray alloc] init];
    }
    return _headImageArr;
}

- (NSMutableArray *)holidayArr{
    if (!_holidayArr) {
        _holidayArr = [[NSMutableArray alloc] init];
    }
    return _holidayArr;
}

- (NSMutableArray *)admissionArr{
    if (!_admissionArr) {
        _admissionArr = [[NSMutableArray alloc] init];
    }
    return _admissionArr;
}


@end
