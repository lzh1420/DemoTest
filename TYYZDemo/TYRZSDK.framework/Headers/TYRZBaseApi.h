//
//  TYRZBaseApi.h
//  TYRZ
//
//  Created by 林涛 on 2017/5/19.
//  Copyright © 2017年 林涛. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^UAFinishBlock)(id sender);

@interface TYRZBaseApi : NSObject
/**
 初始化参数
 @param clientID 申请能力平台成功后，分配给网站的appid
 @param clientSecret 申请能力平台成功后，分配给网站的appSecret
 @param redirect 申请能力平台时填写的地址
 */
+ (void)customInit:(NSString *)clientID clientSecret:(NSString *)clientSecret redirectURL:(NSString *)redirect;

+ (void)checkToken:(NSString *)token complete:(UAFinishBlock)complete;

+ (void)cleanAccount;
@end
