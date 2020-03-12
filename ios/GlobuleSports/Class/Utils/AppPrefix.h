//
//  AppPrefix.h
//  Marbles
//
//  Created by admin on 4/3/2020.
//  Copyright © 2020 Guess. All rights reserved.
//

#ifndef AppPrefix_h
#define AppPrefix_h

//屏幕的宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//判断是否是iPhone X
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_X (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0f)



#endif /* AppPrefix_h */


