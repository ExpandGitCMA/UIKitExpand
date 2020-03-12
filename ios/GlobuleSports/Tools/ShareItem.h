#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ShareItem : NSObject
-(instancetype)initWithData:(UIImage *)img andFile:(NSURL *)file;
@property (nonatomic, strong) UIImage *img;
@property (nonatomic, strong) NSURL *path;
@end
