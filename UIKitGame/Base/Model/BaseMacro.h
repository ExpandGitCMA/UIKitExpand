#import <Foundation/Foundation.h>
#define AppColor                 [UIColor colorWithRGB:0x4991f2]
#define Appx252631               [UIColor colorWithRGB:0x252631]
#define Appxdddddd               [UIColor colorWithRGB:0xDDDDDD]
#define Appx000000               [UIColor colorWithRGB:0x000000]
#define Appx333333               [UIColor colorWithRGB:0x333333]
#define Appx666666               [UIColor colorWithRGB:0x666666]
#define Appx999999               [UIColor colorWithRGB:0x999999]
#define Appxf8f8f8               [UIColor colorWithRGB:0xf8f8f8]
#define Appxffffff               [UIColor colorWithRGB:0xffffff]
#define placeholder [UIImage imageWithColor:[UIColor colorWithRGB:0xf6f6f6]]
#define AppRadius                4.0f
#define AppLineHeight            0.60f
#define AppTop                   15.0f
#define RefreshPageStart (1)
#define RefreshPageSize (35)
#define BaseUrl @"http://cache.tuwan.com/app/"
#define BaseUrl2 @"http://api.tuwan.com/app/"
#define VideoUrl @"http://api.klm123.com/channel/getListById/version/6"
#define kBaseUrl(url)  [NSString stringWithFormat:@"%@%@", BaseUrl, url]
#ifdef DEBUG
#ifndef NSLog
#endif
#endif
@interface BaseMacro : NSObject
+ (NSArray *)hotDatas;
@end
