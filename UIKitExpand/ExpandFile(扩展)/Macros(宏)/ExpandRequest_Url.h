//
//  ExpandRequest_Url.h
//  UIKitExpand
//
//  Created by 童公放 on 2017/8/4.
//  Copyright © 2017年 陈美安. All rights reserved.
//  

#ifndef ExpandRequest_Url_h
#define ExpandRequest_Url_h


#define SeverEnvironment 1

#if  SeverEnvironment==1  //开发测试网络
#define BASE_API_URL @"http://new.iformoney.com/"

#elif SeverEnvironment==2  //正式发布网络
#define BASE_API_URL @"http://new.iformoney.com/"

#endif

#define URL_AppHocus                    @"loveBeen/focus.json.php"    //首页
#define URL_AppIndexList                @"App/Index/Order_List" //首页
#define URL_AppIndexPage           @"App/Index/Order_Index_Page2" //默认

#endif /* ExpandRequest_Url_h */
