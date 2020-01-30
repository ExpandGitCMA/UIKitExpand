//
//  GKBasePlayer.m
//  GKiOSGame
//
//  Created by wangws1990 on 2019/7/18.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKBasePlayer.h"
@interface GKBasePlayer()

@property (strong, nonatomic) UIView *contentView;

@end
@implementation GKBasePlayer
- (void)playUrl:(NSString *)url{
    
}
- (void)seek:(NSTimeInterval)time{
    
}
- (void)play{
    
}
- (void)stop{
    
}
- (void)pause{
    
}
- (void)resume{
    
}
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}
@end


//@implementation GKBaseView
//- (void)layoutSubviews{
//    [super layoutSubviews];
//    NSLog(@"==========%lf %lf",self.frame.size.width,self.frame.size.height);
//}
//@end
