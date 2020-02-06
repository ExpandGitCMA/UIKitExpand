#import <Foundation/Foundation.h>
@interface NSString (RandomKey)
+ (NSString *)randomKey;
@end
@interface NSData (RandomData)
+ (NSData *)randomDataWithLength:(NSUInteger)length;
@end


