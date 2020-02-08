#ifndef SportsBallFile_h
#define SportsBallFile_h
#import "HappenDuringRealm.h"
#import "EXTScope.h"
#import "SportsBallAppUrl.h"
#define ISIPADIDIOM ([UIDevice currentDevice].userInterfaceIdiom != UIUserInterfaceIdiomPhone)
#define SCREEN_WIDTH ([UIScreen  mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] <8.0 ? YES : NO)
#define iOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] <9.0 ? YES : NO)
#define iOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0 ? YES : NO)
#define iOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 ? YES : NO)
#define ISRIGHTTOLEFT  (iOS9 && [UIView instancesRespondToSelector:@selector(semanticContentAttribute)] && ([UIView appearance].semanticContentAttribute == UISemanticContentAttributeForceRightToLeft))
#ifdef DEBUG
#define DEBUG_NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define DEBUG_NSLog(format, ...)
#endif
#define CJW_1PX_WIDTH (1 / [UIScreen mainScreen].scale)
#endif 
