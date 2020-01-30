#import "GKDownModel.h"
#import "BaseDownTool.h"
@implementation GKDownModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"nickName" : @"author.user_name",
             @"page" : @"p",
             @"desc" : @"ext.desc",
             @"bookID" : @[@"id",@"ID",@"book_id"]};
}
- (NSString *)path{
    if ([_path hasPrefix:[AFDownTool downloadPath]]) {
        return _path;
    }
    return [NSString stringWithFormat:@"%@%@",[AFDownTool downloadPath],_path];
}
@end
