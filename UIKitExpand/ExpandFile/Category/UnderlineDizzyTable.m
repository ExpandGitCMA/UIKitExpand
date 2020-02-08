#import "UnderlineDizzyTable.h"
#import "LodingActivity.h"

@interface UnderlineDizzyTable()

@end
@implementation UnderlineDizzyTable

+ (void)showActivityIndicator{

     LodingActivity*loadingView = [[LodingActivity alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
     loadingView.center = [self keyWindow].center;
     [[self keyWindow] addSubview:loadingView];
}

+ (void)hideActivityIndicator{
    UIView *window = [self keyWindow];
    [window.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[LodingActivity class]]) {
            [(LodingActivity *)obj stopAnimating];
            obj.hidden = YES;
            [obj removeFromSuperview];
            *stop = YES;
        }
    }];
}
+(UIView*)keyWindow{
    __block UIWindow *keyWindow;
    NSMutableArray *windows = [[NSMutableArray alloc]initWithArray:[UIApplication sharedApplication].windows];
    [windows enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(UIWindow *window, NSUInteger idx, BOOL *stop) {
        if([window isKindOfClass:[UIWindow class]] && window.windowLevel == UIWindowLevelNormal) {
            keyWindow = window;
            *stop = YES;
        }
    }];
    UIView *window = [[keyWindow subviews] lastObject];
    return window;
}
@end
