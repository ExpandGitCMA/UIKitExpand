#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^zanAction)(void);
typedef void(^shouCangAction)(void);
typedef void(^talkAction)(void);
typedef void(^jubaoAction)(void);
typedef void(^pingBiAction)(void);
@interface MunityNoteCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *diaryMonthLabel;
@property (weak, nonatomic) IBOutlet UILabel *diaryYearLabel;
@property (weak, nonatomic) IBOutlet UIImageView *diaryImageView;
@property (weak, nonatomic) IBOutlet UILabel *diaryNoteLabel;
@property (weak, nonatomic) IBOutlet UIButton *zanBtn;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *headImageV;
@property (weak, nonatomic) IBOutlet UIImageView *dataImageUrls;
@property (weak, nonatomic) IBOutlet UIImageView *dataImageUrl;
@property (weak, nonatomic) IBOutlet UIButton *shouCangBtn;
@property (weak, nonatomic) IBOutlet UIButton *OrgyTalkBtn;
@property (nonatomic,copy)zanAction zanblock;
@property (nonatomic,copy)shouCangAction shoucangBlock;
@property (nonatomic,copy)talkAction talkblockAction;
@property (nonatomic,copy)jubaoAction jubaoblock;
@property (nonatomic,copy)pingBiAction pingBiBlock;

@end
NS_ASSUME_NONNULL_END
