#import "YoBoNoteCell.h"
@implementation YoBoNoteCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.zanBtn.selected = NO;
  
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
- (IBAction)discoryZanBtnAction:(UIButton *)sender {
    if (self.zanblock) {
        self.zanblock();
    }
}
- (IBAction)shouCangBtnAction:(UIButton *)sender {
    if (self.shoucangBlock) {
        self.shoucangBlock();
    }
}
- (IBAction)OrgyTalkBtnAction:(UIButton *)sender {
    if (self.talkblockAction) {
        self.talkblockAction();
    }
}
- (IBAction)OrgyPingBiBtnAction:(UIButton *)sender {
    if (self.pingBiBlock) {
        self.pingBiBlock();
    }
}
- (IBAction)OrgyjubaoBtnAction:(UIButton *)sender {
    if (self.jubaoblock) {
        self.jubaoblock();
    }
}
@end
