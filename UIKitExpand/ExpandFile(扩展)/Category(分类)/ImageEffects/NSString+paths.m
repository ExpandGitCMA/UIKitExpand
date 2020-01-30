#import "NSString+paths.h"
@implementation NSString (paths)
+(NSString*)pathsResourceName:(NSString*)name{
    return  [[NSBundle mainBundle] pathForResource:name ofType:nil];
}
-(NSString *)deleteSpecialCode {
    NSString *string = [self stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    return string;
}
-(NSData *)strData{
    NSRange range = [self rangeOfString:@"file://"];
    if(range.length!=0){
        NSLog(@"请注意：您可能是想要获取本地文件(%@)数据,而不是将此URL地址直接转为对应的NSData。",self);
    }
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}
@end


