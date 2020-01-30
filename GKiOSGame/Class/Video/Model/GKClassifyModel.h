//
//  GKClassifyModel.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/15.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN
@class GKClassifyItem;
@interface GKClassifyModel : BaseModel
@property (copy, nonatomic) NSString *group;
@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray <GKClassifyItem*>*subCategory;
@end


@interface GKClassifyItem : BaseModel
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *tag;
@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *url;

@end


NS_ASSUME_NONNULL_END
