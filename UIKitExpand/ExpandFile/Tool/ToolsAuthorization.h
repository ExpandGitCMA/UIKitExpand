#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void (^ToolsAuthCompletedBlock)(BOOL obj);
@interface ToolsAuthorization : NSObject<UIAlertViewDelegate>
+(instancetype)sharedToolsInstance;
-(void)requestAuthorizationCamera:(ToolsAuthCompletedBlock)completed ;
-(void)requestAuthorizationAlbums:(ToolsAuthCompletedBlock)completed;
@end
NS_ASSUME_NONNULL_END
