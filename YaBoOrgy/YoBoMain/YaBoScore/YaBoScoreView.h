#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface YaBoScoreView : UIView
@property (weak, nonatomic) IBOutlet UITextView *text;
+(instancetype)loadNibNamedYaBoScoreView;
@end
NS_ASSUME_NONNULL_END
