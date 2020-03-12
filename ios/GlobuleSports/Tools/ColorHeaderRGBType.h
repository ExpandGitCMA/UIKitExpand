#ifndef ColorHeaderRGBType_h
#define ColorHeaderRGBType_h

#import <Foundation/Foundation.h>


#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define APP_ID @"V6K88SW7GnwJLtxPevtV8s9l-gzGzoHsz"
#define APP_KEY @"7gazdQAWsTWuutxNHDXn9s9L"
#define API_URL @"https://v6k88sw7.lc-cn-n1-shared.com"


typedef NS_ENUM(UInt32, ColorRGBType) {
     AppMianColor             = 0xFF5A12,

};
#endif 
