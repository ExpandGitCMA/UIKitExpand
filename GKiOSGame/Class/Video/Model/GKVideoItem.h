//
//  GKVideoItem.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/10/9.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN
@class GKVideoModel,GKVideoStreams;
@interface GKVideoItem : BaseModel

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *itemId;

@end

@interface GKItemModel : BaseModel

@property (copy, nonatomic) NSString *followIcon;
@property (copy, nonatomic) NSString *isTop;
@property (copy, nonatomic) NSString *showType;
@property (copy, nonatomic) NSString *showTypeV2;
@property (copy, nonatomic) NSString *type;

@property (strong, nonatomic) GKVideoModel *video;
@end

@interface GKVideoModel : BaseModel

@property (copy, nonatomic) NSString *videoId;
@property (copy, nonatomic) NSString *activityId;
@property (copy, nonatomic) NSString *cate_1;
@property (copy, nonatomic) NSString *cate_2;

@property (copy, nonatomic) NSString *cover;
@property (copy, nonatomic) NSString *docid;
@property (copy, nonatomic) NSString *duration;

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *shareTitle;
@property (copy, nonatomic) NSString *publishTime;

@property (strong, nonatomic) NSArray <GKVideoStreams *>*streams;
//数据库存储
@property (strong, nonatomic) GKVideoStreams *selectStreams;
@property (assign, nonatomic) CGFloat playTime;

@end
@interface GKVideoStreams : BaseModel

@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat bitrate;
@property (assign, nonatomic) CGFloat duration;
@property (assign, nonatomic) CGFloat fps;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat quality;
@property (assign, nonatomic) CGFloat size;
@property (assign, nonatomic) CGFloat width;


@end
NS_ASSUME_NONNULL_END
