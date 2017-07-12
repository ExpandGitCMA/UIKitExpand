//
//  AppDidLaunchAnimation.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/12.
//  Copyright © 2017年 陈美安. All rights reserved.
//

#import "AppDidLaunchAnimation.h"
#import "UIImage+ImageEffects.h"
#import "ExpandFileHeader.h"
#import "AppEnteryConterl.h"
#import <ImageIO/ImageIO.h>
@interface AppDidLaunchAnimation ()
@property(nonatomic,strong)UIImage*image;
@property (nonatomic,strong)UIImageView *imgViewLoading;
@property (nonatomic,strong) NSMutableArray *frames;
@property (nonatomic,strong)UILabel *loading;
@end

static NSString *const life      = @"给生活一点惊喜哦 !";
static int const showtime  = 6;

@implementation AppDidLaunchAnimation

- (NSMutableArray *)frames{
    if (!_frames) {
        _frames = [NSMutableArray array];
        NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"gif_paying" withExtension:@"gif"];
        CGImageSourceRef gifSource = CGImageSourceCreateWithURL((CFURLRef)fileUrl, NULL);
        size_t frameCout = CGImageSourceGetCount(gifSource);
        
        for (size_t i = 0; i<frameCout; i++) {
            CGImageRef imageRef = CGImageSourceCreateImageAtIndex(gifSource, i, NULL);
             UIImage*image = [UIImage imageWithCGImage:imageRef];
            [_frames addObject:image];
            CGImageRelease(imageRef);
        }
    }
    return _frames;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loading];
    [self imgViewLoading];
}


-(UILabel*)loading{
    if (!_loading) {
        CGSize titleSize=[life sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}];
        _loading = [[UILabel alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-titleSize.width)/2, self.view.bounds.size.height/2+64, titleSize.width, titleSize.height)];
        _loading.text = life;
        [self.view addSubview:_loading];
    }
    return _loading;
}

-(UIImageView*)imgViewLoading{
    if (!_imgViewLoading) {
        _image = [[UIImage imageNamed:@"appLaunchAn"] radiuslayer];
        _imgViewLoading = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _image.size.width, _image.size.height)];
        _imgViewLoading.image = _image;
        _imgViewLoading.contentMode = UIViewContentModeCenter;
        _imgViewLoading.center = self.view.center;
        [self.view addSubview:_imgViewLoading];
        [self keyFrameAnimation];
    }
    return _imgViewLoading;
}

- (void)keyFrameAnimation {

    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //    anima.values 关键帧路径数组
    NSValue *a = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-_image.size.width)];
    NSValue *b = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-_image.size.width)];
    NSValue *c = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+_image.size.width)];
    NSValue *d = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+_image.size.width)];
    NSValue *e = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-_image.size.width)];
    NSValue *f = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-_image.size.width)];
    
    anima.values = [NSArray arrayWithObjects:a,b,c,d,e,f, nil];
    anima.duration = showtime;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];// 动画节奏设置
    [_imgViewLoading.layer addAnimation:anima forKey:@"keyFrameAnimation"];
    [self startCoundown];
}



- (void)startCoundown{
    //自己定义TabBar控制器
    BaseTabBarCtrl *tabBar = [[BaseTabBarCtrl alloc]init];
    __block int timeout = showtime-1 ;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
               
                [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    self.view .transform = CGAffineTransformMakeScale(1, 1);
                    self.view.alpha = 0.0;
                } completion:^(BOOL finished) {
                    [self.view removeFromSuperview];
                    [AppEnteryConterl switchBaseTabBarController:tabBar];
                }];
             
            });
        }else{
              timeout--;
        }
    });
    dispatch_resume(_timer);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
