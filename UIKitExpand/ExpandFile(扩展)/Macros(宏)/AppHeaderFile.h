#ifndef AppHeaderFile_h
#define AppHeaderFile_h
#import "AffectRichExhibition.h"
#import "EXTScope.h"
#import "AppRequest_Url.h"
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
#define RefreshPageStart (1)
#define RefreshPageSize (35)
#define NAVI_BAR_HIGHT      (iPhone_Bang ? 88: 64)
#define KiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define KiPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define KiPhoneXMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone_Bang (KiPhoneX  || KiPhoneXR || KiPhoneXMax)
#endif 
