//
//  GKDownModel.h
//  GKiOSGame
//
//  Created by wangws1990 on 2019/10/9.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "BaseModel.h"
#import "GKHomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GKDownModel : BaseModel
@property (nonatomic, assign) BOOL          isAgree;
@property (nonatomic, copy) NSString        *agree_num;
@property (nonatomic, copy) NSString        *agreed_num;
@property (nonatomic, copy) NSString        *comment_num;
@property (nonatomic, copy) NSString        *create_time;
@property (nonatomic, copy) NSString        *first_frame_cover;
@property (nonatomic, copy) NSString        *is_deleted;
@property (nonatomic, copy) NSString        *is_private;
@property (nonatomic, copy) NSString        *need_hide_title;
@property (nonatomic, copy) NSString        *play_count;
@property (nonatomic, copy) NSString        *post_id;
@property (nonatomic, copy) NSString        *share_num;
@property (nonatomic, copy) NSString        *tags;
@property (nonatomic, copy) NSString        *thread_id;
@property (nonatomic, copy) NSString        *thumbnail_height;
@property (nonatomic, copy) NSString        *thumbnail_url;
@property (nonatomic, copy) NSString        *thumbnail_width;
@property (nonatomic, copy) NSString        *title;
@property (nonatomic, copy) NSString        *nickName;
@property (nonatomic, copy) NSString        *video_duration;
@property (nonatomic, copy) NSString        *video_height;
@property (nonatomic, copy) NSString        *video_length;
@property (nonatomic, copy) NSString        *video_log_id;
@property (nonatomic, copy) NSString        *video_url;
@property (nonatomic, copy) NSString        *video_width;

@property (nonatomic, assign) GKDownTaskState taskState;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, copy) NSString *path;//不是整条路径只是一条名称比如 xxx.mp4这样
@end

NS_ASSUME_NONNULL_END
