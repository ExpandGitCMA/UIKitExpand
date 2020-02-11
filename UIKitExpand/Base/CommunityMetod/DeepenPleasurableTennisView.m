#import "DeepenPleasurableTennisView.h"
#import "SportsMacrosHeadr.h"
@implementation DeepenPleasurableTennisView
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.bounds = CGRectMake(0, 0, SCREEN_WIDTH, 20);
    self.textLabel.text = @"没有更多了";
    self.textLabel.font = [UIFont systemFontOfSize:12];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
}
@end
