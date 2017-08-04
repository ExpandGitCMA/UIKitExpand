//
//  ExpandUser.m
//  UIKitExpand
//
//  Created by 童公放 on 2017/8/4.
//  Copyright © 2017年 陈美安. All rights reserved.
//

#import "ExpandUser.h"
#import <objc/runtime.h>


@implementation ExpandUser

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
    ExpandUser *user = [[ExpandUser alloc]init];
    user.name = @"name";
    user.userCode = @"userCode";
    user.sex = @"男";
    user.userId = @"id";
    user.mobile = @"mobile";
    user.imgUrl = @"imgUrl";
    user.userToken = @"userToken";
    user.createDate = @"createDate";
    return user;
}

//当我们归档这个对象的时候就会来到这里!!
- (void)encodeWithCoder:(NSCoder *)coder
{
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([ExpandUser class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString * key = [NSString stringWithUTF8String:name];
        //kvc 获取属性的值
        id value = [self valueForKey:key];
        //归档!!
        [coder encodeObject:value forKey:key];
    }
    free(ivars);
}


- (instancetype)initWithCoder:(NSCoder *)coder{
    if ( self = [super init]) {
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([ExpandUser class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            const char * name = ivar_getName(ivar);
            NSString * key = [NSString stringWithUTF8String:name];
            //解档
            id value = [coder decodeObjectForKey:key];
            //设置到属性上面  kvc
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}

@end
