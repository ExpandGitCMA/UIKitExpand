//
//  GKVideoPlayHeaderView.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/18.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKVideoPlayHeaderView.h"

@implementation GKVideoPlayHeaderView
- (void)awakeFromNib{
    [super awakeFromNib];
    
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.imageV];
        [self addSubview:self.titleLab];
        [self addSubview:self.subTitleLab];
        [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.offset(35);
            make.left.top.equalTo(self.imageV.superview).offset(10);
        }];
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageV.mas_right).offset(10);
            make.right.equalTo(self.titleLab.superview).offset(-10);
            make.top.equalTo(self.imageV);
        }];
        [self.subTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.titleLab);
            make.top.equalTo(self.titleLab.mas_bottom).offset(5);
        }];
        UIView *lineView = [[UIView alloc] init];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.equalTo(lineView.superview);
            make.height.offset(0.6f);
            make.left.equalTo(self.imageV);
        }];
        lineView.backgroundColor = Appxdddddd;
    }return self;
}

- (UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [[UIImageView alloc] init];
        _imageV.layer.masksToBounds = YES;
        _imageV.layer.cornerRadius = 17.5f;
        _imageV.layer.borderWidth = 2.0f;
        _imageV.layer.borderColor = Appx999999.CGColor;
    }
    return _imageV;
}
- (UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = [UIFont systemFontOfSize:16];
        _titleLab.textColor = AppColor;
    }
    return _titleLab;
}

- (UILabel *)subTitleLab{
    if (!_subTitleLab) {
        _subTitleLab = [[UILabel alloc] init];
        _subTitleLab.font = [UIFont systemFontOfSize:12];
        _subTitleLab.textColor = Appx999999;
    }
    return _subTitleLab;
}

@end
