#import <UIKit/UIKit.h>
@interface HotContentCell : UICollectionViewCell
@property(nonatomic,strong)UILabel*titleLabel;
-(void)setSelectCell:(BOOL)isSelect;
- (CGSize)sizeForCell:(NSString*)title;
@end
