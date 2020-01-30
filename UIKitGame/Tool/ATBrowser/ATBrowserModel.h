#import <Foundation/Foundation.h>
#import "ATBrowserProtocol.h"
NS_ASSUME_NONNULL_BEGIN
@interface ATBrowserModel : NSObject<ATBrowserProtocol>
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *url;
@property (strong, nonatomic) UIImage *image;
@end
NS_ASSUME_NONNULL_END
