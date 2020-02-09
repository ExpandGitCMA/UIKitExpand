

#import "BaseMetodVC.h"

typedef void(^loadFlesh)(void);


@interface PostedMetodVC : BaseMetodVC

@property (nonatomic,copy)loadFlesh loadBlock;
@end




