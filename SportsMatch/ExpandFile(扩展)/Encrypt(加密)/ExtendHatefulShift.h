#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>
@interface ExtendHatefulShift : NSObject
+ (instancetype)sharedEncryptionTools;
@property (nonatomic, assign) uint32_t algorithm;
- (NSString *)keepUponMeeting:(NSString *)string keyString:(NSString *)keyString iv:(NSData *)iv;
- (NSString *)undoFarewell:(NSString *)string keyString:(NSString *)keyString iv:(NSData *)iv;
@end
