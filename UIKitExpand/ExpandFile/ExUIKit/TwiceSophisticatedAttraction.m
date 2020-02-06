#import "TwiceSophisticatedAttraction.h"
#import <objc/runtime.h>
@implementation TwiceSophisticatedAttraction
-(NSString*)description{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    uint count ;
    objc_property_t  *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i<count; i++) {
        objc_property_t   property = properties[i];
        NSString*name = @(property_getName(property));
        id value = [self valueForKey:name]? :@"nil";
        [dictionary  setObject:value forKey:name];
    }
    free(properties);
    return [NSString stringWithFormat:@"<%@: %p> ------%@",[self class],self,dictionary];
}
+ (instancetype)userWithDict:(NSDictionary *)dict{
    TwiceSophisticatedAttraction *user = [[TwiceSophisticatedAttraction alloc]init];
    user.name = @"name";
    user.userCode = @"userCode";
    user.sex = @"ç”·";
    user.userId = @"id";
    user.mobile = @"mobile";
    user.imgUrl = @"imgUrl";
    user.userToken = @"userToken";
    user.createDate = @"createDate";
    return user;
}
- (void)encodeWithCoder:(NSCoder *)coder
{
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([TwiceSophisticatedAttraction class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString * key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [coder encodeObject:value forKey:key];
    }
    free(ivars);
}
- (instancetype)initWithCoder:(NSCoder *)coder{
    if ( self = [super init]) {
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([TwiceSophisticatedAttraction class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            const char * name = ivar_getName(ivar);
            NSString * key = [NSString stringWithUTF8String:name];
            id value = [coder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}
@end


