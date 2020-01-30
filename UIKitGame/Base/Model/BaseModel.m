#import "BaseModel.h"
#import <YYKit/NSObject+YYModel.h>
@interface BaseModel ()
@end
@implementation BaseModel
#pragma mark - Coding/Copying/hash/equal/description
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self modelEncodeWithCoder:aCoder];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    return [self modelInitWithCoder:aDecoder];
}
- (id)copyWithZone:(NSZone *)zone {
    return [self modelCopy];
}
- (NSUInteger)hash {
    return [self modelHash];
}
- (BOOL)isEqual:(id)object {
    return [self modelIsEqual:object];
}
- (NSString *)description {
    return [self modelDescription];
}
#pragma mark - Attributes
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return nil;
}
+ (NSDictionary *)modelCustomPropertyMapper {
    return nil;
}
#pragma mark - 黑名单与白名单
+ (NSArray *)modelPropertyBlacklist {
    return nil;
}
+ (NSArray *)modelPropertyWhitelist {
    return nil;
}
#pragma mark - 数据校验与自定义转换
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    return YES;
}
- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic {
    return YES;
}
#pragma mark archived and unarchive
+ (NSData *)archivedDataForData:(id)data
{
    NSData * resData = nil;
    @try {
        resData = [NSKeyedArchiver archivedDataWithRootObject:data];
    }
    @catch (NSException *exception) {
        NSLog(@"%s,%d,%@", __FUNCTION__, __LINE__, exception.description);
        resData = nil;
    }
    @finally {
    }
    return resData;
}
+ (id)unarchiveForData:(NSData*)data
{
    id resObj = nil;
    @try {
        resObj = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    @catch (NSException *exception) {
        NSLog(@"%s,%d,%@", __FUNCTION__, __LINE__, exception.description);
        resObj = nil;
    }
    @finally {
    }
    return resObj;
}
    @end
