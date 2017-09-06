//
//  TYRZUILogin.h
//  TYRZ
//
//  Created by 林涛 on 2017/6/21.
//  Copyright © 2017年 林涛. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TYRZUILogin : NSObject
/**
 短信验证码登录
 */
+ (void)loginSMS:(UIViewController *)vc complete:(void (^)(id sender))complete;

/**
 显式登录
 */
+ (void)loginExplicitly:(UIViewController *)vc complete:(void (^)(id sender))complete;

/**
 是否选择移动提供短信验证码代替取号失败返回
 */
+ (void)setCustomSMS:(BOOL)enable;
@end
