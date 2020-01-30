//
//  BestModel.h
//  UIKitExpand
//
//  Created by Smell Zero on 2020/1/30.
//  Copyright © 2020 陈美安. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BestModel : NSObject
@property (nonatomic, retain)NSString *title;
@property (nonatomic, retain)NSString *rule;
+ (BestModel *)setModelWithDictionary:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
