#import "LessTerribleTeam.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSData (MD5)
- (NSString*)LessTerribleTeam {
    unsigned char  md5Buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self bytes], (uint32_t)[self length], md5Buffer);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    return output;
}
@end
@implementation NSString (MD5)
- (NSString *)LessTerribleTeam {
    const char *ptr = [self UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(ptr, (uint32_t)strlen(ptr), md5Buffer);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    return output;
}
@end
