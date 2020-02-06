#import <sys/time.h>
#import <Security/SecRandom.h>
#import "SprainTimberRelevant.h"
#import "LessTerribleTeam.h"
@implementation NSString (RandomKey)
+ (NSString *)randomKey {
    NSString *UUIDString;
    CFUUIDRef UUIDRef = CFUUIDCreate(NULL);
    CFStringRef UUIDStringRef = CFUUIDCreateString(NULL, UUIDRef);
    UUIDString = (NSString *)CFBridgingRelease(UUIDStringRef);
    CFRelease(UUIDRef);
    double time = CFAbsoluteTimeGetCurrent();
    return [[NSString stringWithFormat:@"%@%f", UUIDString, time] MD5];
}
@end
@implementation NSData (RandomData)
+ (NSData *)randomDataWithLength:(NSUInteger)length {
    NSMutableData* data = [NSMutableData dataWithLength:length];
    int err = SecRandomCopyBytes(kSecRandomDefault, length, [data mutableBytes]);
    if (err)
        return nil;
    else
        return data;
}
@end
