#import "GKClassifyModel.h"
@implementation GKClassifyModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"subCategory" : [GKClassifyItem class] };
}
@end
@implementation GKClassifyItem
@end
