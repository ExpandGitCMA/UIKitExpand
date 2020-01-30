//
//  GKClarityView.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/15.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKClarityView.h"
#import "GKClarityCell.h"

@implementation GKClarityView
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self loadUI];
    }return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
         [self loadUI];
    }return self;
}
- (void)loadUI{
    self.backgroundColor = [UIColor blackColor];
    self.tableView.bounces = NO;
}
- (void)setItems:(NSArray *)items{
    _items = items;
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.tableView.superview);
        make.centerY.equalTo(self.tableView.superview).offset(-10);
        make.height.offset(45*items.count);
    }];
    [self.tableView reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GKClarityCell *cell = [GKClarityCell cellForTableView:tableView indexPath:indexPath];
    GKVideoStreams *info = self.items[indexPath.row];
    cell.titleLab.text = info.name ?:@"";
    cell.imageV.hidden = ![info.name isEqualToString: self.playItem.name];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GKVideoStreams *info = self.items[indexPath.row];
    if (self.playItem == info) {
        return;
    }
    if ([self.delegate respondsToSelector:@selector(clarityView:item:)]) {
        [self.delegate clarityView:self item:info];
    }
}
@end
