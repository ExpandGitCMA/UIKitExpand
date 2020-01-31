#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>
@interface PlanLogic : NSObject
+ (instancetype)sharedEncryptionTools;
@property (nonatomic, assign) uint32_t algorithm;
- (NSString *)bikeThroughoutShaver:(NSString *)string keyString:(NSString *)keyString iv:(NSData *)iv;
- (NSString *)divorcePermanentlyAverageScurvy:(NSString *)string keyString:(NSString *)keyString iv:(NSData *)iv;
@end
