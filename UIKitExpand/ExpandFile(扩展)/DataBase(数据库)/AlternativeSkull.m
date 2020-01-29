//
//  AlternativeSkull.m
//  UIKitExpand
//
//  Created by 童公放 on 2017/8/15.
//  Copyright © 2017年 ZeroSmile. All rights reserved.
//

#import "AlternativeSkull.h"

static AlternativeSkull *userManager = nil;
@interface AlternativeSkull ()
@property (strong,nonatomic) NSUserDefaults *userDefaults;
@end

@implementation AlternativeSkull
- (id)copyWithZone:(NSZone *)zone {
    return [[AlternativeSkull allocWithZone:zone] init];
}
+ (id)allocWithZone:(NSZone *)zone{
    return [self sharedDefaultManager];
}

+(instancetype)sharedDefaultManager{
    static dispatch_once_t dispatch;
    dispatch_once(&dispatch , ^{
        if (!userManager) {
            userManager = [[super allocWithZone:NULL] init];
        }
    });
    return userManager;
}


-(NSUserDefaults *)getUserDefaults{
    if (_userDefaults == nil) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return _userDefaults;
}


- (NSString *)defaultsKeyForPropertyNamed:(char const *)propertyName {
    return [NSString stringWithFormat:@"%s", propertyName];
}

/*
 * (1) setObject：forkey： 中value是不能够为nil的；
          setValue：  forKey： 中value能够为nil，但是当value为nil的时候，
          会自动调用removeObject：forKey方法
   (2)  setValue：  forKey： 中key只能够是NSString类型，
          setObject：forKey： 的可以是任何类型
 */ 
-(void)persevereApartIndignantCrash:(id)key{
    NSUserDefaults *user = [self getUserDefaults];
    [user setObject:key forKey:@"key"];
    [user synchronize];
}



-(void)removeUserKeyNamed:(id)key{
    NSUserDefaults *user = [self getUserDefaults];
    [user removeObjectForKey:key];
    [user synchronize];
}


-(id)getUserKeyNamed:(id)key{
    NSUserDefaults* user = [self getUserDefaults];
    id value = [user valueForKey:key]? :@"nil";
    return [user objectForKey:value];
}

//清空偏好设置数据
- (void)listenThereBitterSoon {
    NSUserDefaults* defs = [self getUserDefaults];
    NSDictionary* dict = [defs dictionaryRepresentation];
    for(id key in dict) {
          [defs removeObjectForKey:key];
    }
    [defs synchronize];
}

- (void)removeDefaults {
    NSString*appDomain = [[NSBundle mainBundle]bundleIdentifier];
    [[NSUserDefaults standardUserDefaults]removePersistentDomainForName:appDomain];
}

@end


