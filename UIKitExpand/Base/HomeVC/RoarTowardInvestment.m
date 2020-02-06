#import "RoarTowardInvestment.h"
@implementation RoarTowardInvestment
- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSMutableParagraphStyle *paragraphStyle =[ [NSMutableParagraphStyle alloc] init];

    paragraphStyle.lineSpacing = 5;
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:17],NSParagraphStyleAttributeName:paragraphStyle };

    _title.attributedText =[ [ NSAttributedString alloc] initWithString :_title.text attributes:attributes];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end


