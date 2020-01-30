#import <Foundation/Foundation.h>
@interface BackwardTallWreck : NSObject
@property (nonatomic, retain)NSString *sid;
@property (nonatomic, retain)NSString *title;
@property (nonatomic, retain)NSString *tags;
@property (nonatomic, retain)NSString *hits;
@property (nonatomic, retain)NSString *add_time;
@property (nonatomic, retain)NSString *pubtime;
@property (nonatomic, retain)NSString *modtime;
@property (nonatomic, retain)NSString *thumb_id;
@property (nonatomic, retain)NSString *origin_url;
@property (nonatomic, retain)NSString *modtime_desc;
@property (nonatomic, retain)NSArray *comm_count;
+ (BackwardTallWreck *)setModelWithDictionary:(NSDictionary *)dic;
@end


