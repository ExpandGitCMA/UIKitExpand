//
//  NSString+paths.m
//  UIKitExpand
//
//  Created by ZeroSmile on 2017/7/11.
//  Copyright © 2017年 陈美安. All rights reserved.
//

#import "NSString+paths.h"

@implementation NSString (paths)

+(NSString*)pathsResourceName:(NSString*)name{
    return  [[NSBundle mainBundle] pathForResource:name ofType:nil];
}

/**
 *  处理json格式的字符串中的换行符、回车符
 */
-(NSString *)deleteSpecialCode {
    
    NSString *string = [self stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    string = [string stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    
    return string;
}


/**
 *  字符串转data
 */
-(NSData *)strData{
    
    NSRange range = [self rangeOfString:@"file://"];
    
    if(range.length!=0){
        
        NSLog(@"请注意：您可能是想要获取本地文件(%@)数据,而不是将此URL地址直接转为对应的NSData。",self);
    }
    
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}
@end
