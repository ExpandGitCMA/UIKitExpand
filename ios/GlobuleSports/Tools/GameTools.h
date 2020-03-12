#ifndef GameTools_h
#define GameTools_h

#define SCREEN_WIDTH ([UIScreen  mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#define ISRIGHTTOLEFT  (iOS9 && [UIView instancesRespondToSelector:@selector(semanticContentAttribute)] && ([UIView appearance].semanticContentAttribute == UISemanticContentAttributeForceRightToLeft))


#ifdef DEBUG
#define DEBUG_NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define DEBUG_NSLog(format, ...)
#endif


#endif 
