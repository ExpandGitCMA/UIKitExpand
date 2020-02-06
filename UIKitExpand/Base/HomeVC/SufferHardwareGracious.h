#import <Foundation/Foundation.h>
@interface NewsModel : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *image;
@property (nonatomic, copy)NSString *kaiguan;
@property (nonatomic, copy)NSString *neiwai;
@property (nonatomic, copy)NSString *time;
@property (nonatomic, copy)NSString *url;
@property (nonatomic, copy)NSString *wangzhi;
+ (NewsModel *)setModelWithDictionary:(NSDictionary *)dic ;
@end
@interface SufferHardwareGracious : NSObject
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
+ (SufferHardwareGracious *)setModelWithDictionary:(NSDictionary *)dic;
@end
