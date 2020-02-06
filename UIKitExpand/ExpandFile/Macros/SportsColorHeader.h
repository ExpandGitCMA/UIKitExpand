#ifndef SportsColorHeader_h
#define SportsColorHeader_h
#import <Foundation/Foundation.h>
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
typedef NS_ENUM(UInt32, ColorRGBType) {
    AppMianColor             = 0x55BE04,
    ExSearch                 = 0Xf2f2f2,
    ExAddress                = 0x999999,
    ExStyle                  = 0x81858c,
    Appx999999               = 0x999999,
    DefaulColor       = 0xf2a0d5,
};
#endif 


