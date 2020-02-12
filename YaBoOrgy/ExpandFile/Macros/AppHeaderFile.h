#ifndef AppHeaderFile_h
#define AppHeaderFile_h
#import "FavourStrip.h"
#import "EXTScope.h"
#import "AppRequest_Url.h"


#define SCREEN_WIDTH ([UIScreen  mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#define ISRIGHTTOLEFT  (iOS9 && [UIView instancesRespondToSelector:@selector(semanticContentAttribute)] && ([UIView appearance].semanticContentAttribute == UISemanticContentAttributeForceRightToLeft))


#ifdef DEBUG
#define DEBUG_NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define DEBUG_NSLog(format, ...)
#endif



#define APP_NAME ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"])
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_BUILD ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])


#endif 
