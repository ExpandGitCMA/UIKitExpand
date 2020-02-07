#import <Foundation/Foundation.h>
@interface ItemSportsModel : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *thumbnail;
@property (nonatomic, copy)NSString *time;
@property (nonatomic, copy)NSDictionary *link;
+ (ItemSportsModel *)setModelWithDictionary:(NSDictionary *)dic ;
@end
@interface NewsModel : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *thumbnail;
@property (nonatomic, copy)NSString *source;
@property (nonatomic, copy)NSString *content;
@property (nonatomic, copy)NSDictionary *link;
@property (nonatomic, copy)NSString *intro;
+ (NewsModel *)setModelWithDictionary:(NSDictionary *)dic ;
@end
@interface VomitTime : NSObject
@property (nonatomic, copy)NSString *sid;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *tags;
@property (nonatomic, copy)NSString *hits;
@property (nonatomic, copy)NSString *add_time;
@property (nonatomic, copy)NSString *pubtime;
@property (nonatomic, copy)NSString *modtime;
@property (nonatomic, copy)NSString *thumb_id;
@property (nonatomic, copy)NSString *origin_url;
@property (nonatomic, copy)NSString *modtime_desc;
@property (nonatomic, copy)NSArray *comm_count;
+ (VomitTime *)setModelWithDictionary:(NSDictionary *)dic;
@end
