
#import <Foundation/Foundation.h>

@interface NSData (RSA)

- (NSData *)RSAEncryptWithPublicKey:(NSString *)pubKey;

@end

@interface NSString (RSA)

- (NSString *)RSAEncryptWithPublicKey:(NSString *)pubKey;

@end
