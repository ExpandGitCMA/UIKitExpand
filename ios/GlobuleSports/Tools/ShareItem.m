#import "ShareItem.h"
@implementation ShareItem

-(instancetype)initWithData:(UIImage *)img andFile:(NSURL *)file
{
    self = [super init];
    if (self) {
        _img = img;
        _path = file;
    }
    return self;
}

-(instancetype)init
{
    return nil;
}

#pragma mark - UIActivityItemSource
-(id)activityViewControllerPlaceholderItem:(UIActivityViewController *)activityViewController
{
    return _img;
}

-(id)activityViewController:(UIActivityViewController *)activityViewController itemForActivityType:(NSString *)activityType
{
    return _path;
}

-(NSString*)activityViewController:(UIActivityViewController *)activityViewController subjectForActivityType:(NSString *)activityType
{
    return @"";
}

@end
