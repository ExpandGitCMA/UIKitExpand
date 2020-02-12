#import "DisapproveGerm.h"
#import "DisBamboo.h"
#import "DisGermTools.h"
static DisapproveGerm * _tool = nil;
@interface DisapproveGerm ()
@property (nonatomic,strong)NSMutableArray * BillCacheArr;
@property (nonatomic,strong)NSMutableArray * cacheArr;
@property (nonatomic,strong)NSMutableArray * imageDataArr;
@property (nonatomic,strong)NSMutableArray * headImageArr;
@property (nonatomic,strong)NSMutableArray * holidayArr;
@property (nonatomic,strong)NSMutableArray * admissionArr;
@end

@implementation DisapproveGerm

-(void)reproduceVitamin:(NSString *)holidayModel{
    
}
-(void)fileBearColourful:(NSString *)BillModelStr{
    
}

-(void)boastAtChorus:(NSString *)missionModel{
    
}

+(instancetype)shared{
    if (_tool == nil) {
        _tool = [[DisapproveGerm alloc] init];
    }
     return _tool;
}
+ (UIColor *)conversionWithColorStr:(NSString *)colorStr{
    NSString * String = [[colorStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]uppercaseString];
    NSLog(@"string:%@",String);
    if ([String length] < 6) {
        return [UIColor clearColor];
    }
    if ([String hasPrefix:@"0X"]) {
        String = [String substringFromIndex:2];
    }
    if ([String hasPrefix:@"#"]) {
        String = [String substringFromIndex:1];
    }
    if ([String length] != 6) {
        return [UIColor clearColor];
    }
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString * rStr = [String substringWithRange:range];
    range.location = 2;
    NSString * gStr = [String substringWithRange:range];
    range.location = 4;
    NSString * bStr = [String substringWithRange:range];
    unsigned int r,g,b;
  [[NSScanner scannerWithString:rStr] scanHexInt:&r];
  [[NSScanner scannerWithString:gStr] scanHexInt:&g];
  [[NSScanner scannerWithString:bStr] scanHexInt:&b];
    NSLog(@"r:%ug:%ub:%u",r,g,b);    
    return [UIColor colorWithRed:((float)r/255.0f) green:((float)g/255.0f) blue:((float)b/255.0f) alpha:1.0];
}



+ (NSString *)conversionDateFormat{
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"YYYY-MM-dd"];
    NSDate * dateNow = [NSDate date];
    NSString * currentStr = [format stringFromDate:dateNow];
    return currentStr;
}
-(NSString *)UIImageToBase64Str:(UIImage *) image
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}
- (void)ultimatelyGlobalDusk:(NSString *)str{
    if ([self isFirstShow:str]) {
        NSArray * arrImage = @[@"februaryNiao",@"februaryAiao",@"februaryBiao",@"februaryQiao",@"februaRtsQiao"];
        for (NSInteger i = 0; i < arrImage.count; i++) {
            UIImage * image = [UIImage imageNamed:arrImage[i]];
            NSString * imageDataStr = [self UIImageToBase64Str:image];
            [self.imageDataArr addObject:imageDataStr];
        }
        NSArray * headImageArr = @[@"Icon1",@"Icon2",@"Icon3",@"Icon4",@"Icon5"];
        for (NSInteger i = 0; i < headImageArr.count; i++) {
            UIImage * image = [UIImage imageNamed:headImageArr[i]];
            NSString * imageDataStr = [self UIImageToBase64Str:image];
            [self.headImageArr addObject:imageDataStr];
        }
        
        
        NSArray * arr = @[
            @{
                   @"dataImageStr":self.imageDataArr[2],
                   @"news":@"坚持就会有效果,加油我们是最优秀的一群人,我们是一群热爱足球的人，努力奔跑永不言弃！",
                   @"dateStr":@"2019-12-6",
                   @"token":@"3",
                   @"liker":@"19",
                  @"collect":@"45",
                  @"name":@"南平三叔的竹叶",
                  @"ImageUrls":@"",
                  @"ImageUrl":@"",
                  @"headimageStr":self.headImageArr[2]
                   
            },
           
        @{
             @"dataImageStr":self.imageDataArr[3],
             @"news":@"孩子们今天真开心,这场开心的踢球",
             @"dateStr":@"2019-12-12",
             @"token":@"2",
             @"liker":@"9",
             @"collect":@"22",
             @"name":@"十分爱你的肉肉",
             @"ImageUrls":[self UIImageToBase64Str:[UIImage imageNamed:@"febasodfjhasuarhs"]],
               @"ImageUrl":[self UIImageToBase64Str:[UIImage imageNamed:@"febasodfjerwearhs"]],
             @"headimageStr":self.headImageArr[1]
             
        },
        @{
              @"dataImageStr":self.imageDataArr[4],
              @"news":@"周末踢球活动真开心😄",
              @"dateStr":@"2019-12-10",
              @"token":@"3",
              @"liker":@"22",
              @"collect":@"31",
             @"name":@"小故事多多",
             @"ImageUrls":@"",
             @"ImageUrl":@"",
             @"headimageStr":self.headImageArr[4],
           },
                          
    @{
        @"dataImageStr":self.imageDataArr[1],
        @"news":@"有甜有咸有咸,挥汗如雨的下午时光",
        @"dateStr":@"2019-2-6",
        @"token":@"4",
        @"liker":@"12",
        @"collect":@"66",
        @"name":@"詹老头子",
        @"ImageUrls":@"",
        @"ImageUrl":@"",
        @"headimageStr":self.headImageArr[3]
        
    },
     @{
            @"dataImageStr":self.imageDataArr[0],
            @"news":@"周末带孩子去足球公园踢下足球",
            @"dateStr":@"2020-01-03",
            @"token":@"1",
            @"liker":@"56",
            @"collect":@"12",
            @"name":@"抓小喵的兔子",
            @"ImageUrls":[self UIImageToBase64Str:[UIImage imageNamed:@"februarytyoiahs"]],
            @"ImageUrl":[self UIImageToBase64Str:[UIImage imageNamed:@"febfgsuarhs"]],
           @"headimageStr":self.headImageArr[0]
         },
      
];
      
        
        for (NSDictionary * dic in arr) {
            DisBamboo * model = [[DisBamboo alloc] init];
            model.dataImageStr = dic[@"dataImageStr"];
            model.dataImageUrls= dic[@"ImageUrls"];
            model.dataImageUrl = dic[@"ImageUrl"];
            model.dateStr = dic[@"dateStr"];
            model.token = dic[@"token"];
            model.news = dic[@"news"];
            model.liker = dic[@"liker"];
            model.collect = dic[@"collect"];
            model.name = dic[@"name"];
            model.headimageStr = dic[@"headimageStr"];
            [self.cacheArr addObject:model];
        }
        [[DisGermTools slidingDiaryShare] saveObjects:self.cacheArr];
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
