#import "ThroughKindheartedKitten.h"
@implementation UINavigationController (ExpandBar)
-(void)captureNavigationType:(NavigationType)type
             NavigationStyle:(NavigationStyle)style
                   barTarget:(id)target action:(SEL)action
                       title:(NSString*)title{
    UIBarButtonItem *barItem;
    switch (type) {
        case NavigationBarTextStyle :{
            barItem = [[UIBarButtonItem alloc] initWithTitle:title style:
                       UIBarButtonItemStylePlain
                                                      target:target
                                                      action:action];
            [self setNavigationStyle:style BarItem:barItem];
        }
            break;
        case NavigationBarImageStyle:{
            barItem = [[UIBarButtonItem alloc] initWithImage:
                       [UIImage imageNamed:title]style:
                       UIBarButtonItemStylePlain
                                                      target:target
                                                      action:action];
            [self setNavigationStyle:style BarItem:barItem];
        }
            break;
        default:
            break;
    }
}
-(UIBarButtonItem*)setNavigationStyle:(NavigationStyle)style BarItem:(UIBarButtonItem*)barItem{
    switch (style) {
        case NavLeftStyle:{
            return  self.topViewController.navigationItem.leftBarButtonItem = barItem ;
        }
            break;
        case NavRightStyle:{
            return  self.topViewController.navigationItem.rightBarButtonItem = barItem ;
        }
            break;
        default:
            break;
    }
}
@end
