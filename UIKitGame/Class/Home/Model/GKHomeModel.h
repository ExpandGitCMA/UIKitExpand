#import "BaseModel.h"
NS_ASSUME_NONNULL_BEGIN
@class GKHomeNewModel,GKHeadItem;
@interface GKHomeModel : BaseModel
@property (strong, nonatomic) NSArray<GKHomeNewModel*>*list;
@property (strong, nonatomic) NSArray<GKHeadItem*>*indexpic;
@end
@interface GKHeadItem : BaseModel
@property (copy, nonatomic) NSString *aid;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *des;
@property (copy, nonatomic) NSString *html5;
@property (copy, nonatomic) NSString *litpic;
@property (copy, nonatomic) NSString *longtitle;
@property (copy, nonatomic) NSString *murl;
@property (copy, nonatomic) NSString *pubdate;
@property (assign, nonatomic) NSInteger showtype;
@property (assign, nonatomic) NSInteger click;
@property (assign, nonatomic) NSInteger comment;
@property (assign, nonatomic) NSTimeInterval timestamp;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *typechild;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *writer;
@end
@interface GKHomeNewModel : GKHeadItem
@end
@interface GKHomeItem : BaseModel
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *mod;
@property (copy, nonatomic) NSString *dtid;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *classs;
@property (copy, nonatomic) NSString *classmore;
@property (copy, nonatomic) NSString *typechild;
@property (copy, nonatomic) NSString *ids;
+ (instancetype)vcWithTitle:(NSString *)title mod:(NSString *)mod dtid:(NSString *)dtid;
+ (instancetype)vcWithTitle:(NSString *)title
                        mod:(NSString *)mod
                       dtid:(NSString *)dtid
                       type:(NSString *)type
                     classs:(NSString *)classs
                  classmore:(NSString *)classmore;
@end
NS_ASSUME_NONNULL_END
