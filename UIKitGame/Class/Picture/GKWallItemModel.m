#import "GKWallItemModel.h"
@implementation GKWallItemModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"title" : @[@"title",@"text"],@"url":@"pic"};
}
@end
