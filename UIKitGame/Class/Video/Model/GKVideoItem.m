#import "GKVideoItem.h"
@implementation GKVideoItem
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"itemId" : @[@"itemId",@"id"]};
}
@end
@implementation GKItemModel
@end
@implementation GKVideoModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"streams" : GKVideoStreams.class};
}
- (GKVideoStreams *)selectStreams{
    if (!_selectStreams) {
        return self.streams.firstObject;
    }
    return _selectStreams;
}
@end
@implementation GKVideoStreams
- (NSString *)name{
    return [NSString stringWithFormat:@"%@x%@",@(self.width),@(self.height)];
}
@end
