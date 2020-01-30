#import <Foundation/Foundation.h>
@interface NSString (IMAdditions)
- (BOOL)isWhitespaceOrNewLines;
- (NSDictionary *)queryContentsUsingEncoding:(NSStringEncoding)encoding;
- (NSString *)stringByAddingQueryDictionary:(NSDictionary *)query;
- (NSString *)stringByAddingURLEncodedQueryDictionary:(NSDictionary *)query;
- (NSString *)urlEncoded;
- (NSString *)urlEncodedString;
- (NSString *)urlDecoded;
- (NSString *)trim;
@property (nonatomic, readonly) NSString *md5Hash;
@end
@interface NSData (IMAdditions)
@property (nonatomic, readonly) NSString *md5Hash;
@property (nonatomic, readonly) NSString *sha1Hash;
@end
@interface NSObject (JudgeNull)
- (BOOL)isNull;
@end
