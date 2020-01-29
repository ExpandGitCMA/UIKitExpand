#import <Foundation/Foundation.h>
@interface WoundBitterStuff : NSObject
+ (instancetype)sharedRSACryptor;
- (void)meetAcrossMisleadingPan:(NSUInteger)keySize;
- (void)loadPublicKey:(NSString *)publicKeyPath;
- (void)loadPrivateKey:(NSString *)privateKeyPath password:(NSString *)password;
- (NSData *)encryptData:(NSData *)plainData;
- (NSData *)decryptData:(NSData *)cipherData;
@end
