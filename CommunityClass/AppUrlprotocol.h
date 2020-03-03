#ifndef AppUrlprotocol_h
#define AppUrlprotocol_h




#define SCREEN_WIDTH ([UIScreen  mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#ifdef DEBUG
#define DEBUG_NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define DEBUG_NSLog(format, ...)
#endif



#define CJW_1PX_WIDTH (1 / [UIScreen mainScreen].scale)

#define  URL_System      @"App/Index/SportsGame"
#define  URL_HomeBanner  @"App/Api/SportsGame/HomeBanner"
#define  URL_Gamerule  @"App/Api/SportsGame/Gamerule"
#define  URL_HomeNews @"http://zhiboba.3b2o.com/article/listJson/category/soccer?1452072425"
#define  URL_ComNews   @"https://api.iclient.ifeng.com/ClientNews?"

#define APP_ID @"V6K88SW7GnwJLtxPevtV8s9l-gzGzoHsz"
#define APP_KEY @"7gazdQAWsTWuutxNHDXn9s9L"
#define API_URL @"https://v6k88sw7.lc-cn-n1-shared.com"

#define UMAPP_Appkey @"5e3e5e1f4ca357829b000099"
#define UMAPP_AppChannel @"App Store"
#endif 
