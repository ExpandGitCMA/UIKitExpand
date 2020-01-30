#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, NavigationType){
    NavigationBarTextStyle   ,
    NavigationBarImageStyle  ,
};
typedef NS_ENUM(NSInteger, NavigationStyle){
    NavLeftStyle  ,
    NavRightStyle ,
};
@interface   UINavigationController (ExpandBar)
-(void)captureNavigationType:(NavigationType)type
             NavigationStyle:(NavigationStyle)style
                   barTarget:(id)target action:(SEL)action
                       title:(NSString*)title;
@end


