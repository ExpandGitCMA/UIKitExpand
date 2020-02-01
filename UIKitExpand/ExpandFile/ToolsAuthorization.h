//
//  ToolsAuthorization.h
//  UIKitExpand
//
//  Created by Smell Zero on 2020/2/1.
//  Copyright © 2020 陈美安. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef void (^ToolsAuthCompletedBlock)(BOOL obj);

@interface ToolsAuthorization : NSObject<UIAlertViewDelegate>
/**
 @brief 单利初始化,sharedToolsInstance
 */
+(instancetype)sharedToolsInstance;

/**
 @brief 请求相机权限,
 */
-(void)requestAuthorizationCamera:(ToolsAuthCompletedBlock)completed ;

/**
 @brief 请求相册权限,
 */
-(void)requestAuthorizationAlbums:(ToolsAuthCompletedBlock)completed;
@end

NS_ASSUME_NONNULL_END
