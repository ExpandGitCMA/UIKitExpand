#import "OweUnderneathBamboo.h"
@interface OweUnderneathBamboo ()
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSURL *url;
@property (nonatomic, copy) UIImage *image;
@property (nonatomic, copy) NSString *type;
@end
@implementation OweUnderneathBamboo
- (instancetype)initWithTitle:(NSString *)title ActivityImage:(UIImage *)activityImage URL:(NSURL *)url ActivityType:(NSString *)activityType{
    self = [super init];
    if (self) {
        self.title = title;
        self.url = url;
        self.image = activityImage;
        self.type = activityType;
    }
    return self;
}
+ (UIActivityCategory)activityCategory{
    return UIActivityCategoryAction;
}
- (NSString *)activityType{
    return _type;
}
- (NSString *)activityTitle {
    return _title;
}
- (UIImage *)_activityImage {
    return _image;
}
- (NSURL *)activityUrl{
    return _url;
}
- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    return YES;
}
- (void)prepareWithActivityItems:(NSArray *)activityItems {
}
- (void)performActivity {
    [self activityDidFinish:YES];
}
@end


