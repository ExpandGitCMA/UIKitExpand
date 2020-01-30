#import "GKHomeModel.h"
@implementation GKHomeModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : GKHomeNewModel.class,
             @"indexpic" : GKHeadItem.class,
             };
}
@end
@implementation GKHeadItem
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"description"  : @[@"description",@"des"],@"itemId":@[@"itemId",@"id"]};
}
@end
@implementation GKHomeNewModel
@end
@implementation GKHomeItem
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"classs"  : @[@"classs",@"class"],@"ids":@[@"ids",@"id"]};
}
+ (instancetype)vcWithTitle:(NSString *)title mod:(NSString *)mod dtid:(NSString *)dtid;{
    return [GKHomeItem vcWithTitle:title mod:mod dtid:dtid type:@"" classs:@"" classmore:@""];
}
+ (instancetype)vcWithTitle:(NSString *)title
                        mod:(NSString *)mod
                       dtid:(NSString *)dtid
                       type:(NSString *)type
                     classs:(NSString *)classs
                  classmore:(NSString *)classmore{
    GKHomeItem *item = [[GKHomeItem alloc] init];
    item.title = title;
    item.mod = mod;
    item.dtid = dtid;
    item.type = type;
    item.classs = classs;
    item.classmore = classmore;
    return item;
}
@end
