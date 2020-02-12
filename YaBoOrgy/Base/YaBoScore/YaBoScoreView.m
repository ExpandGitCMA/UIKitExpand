#import "YaBoScoreView.h"
@implementation YaBoScoreView
+(instancetype)loadNibNamedYaBoScoreView{
   YaBoScoreView *privacyView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YaBoScoreView class]) owner:nil options:nil] lastObject];
   return privacyView;
}
@end
