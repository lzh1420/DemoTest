//
//  UAEnum.h
//  TYRZ
//
//  Created by pro on 2017/4/24.
//  Copyright © 2017年 林涛. All rights reserved.
//

#ifndef UAEnum_h
#define UAEnum_h

/**
 取号认证类型
 */
typedef NS_ENUM(NSInteger, UAAuthType) {
    UAAuthGA = 1,      //网关
    UAAuthSMSUP = 2,   //短信上行
};

typedef NS_ENUM(NSInteger,UALoginType) {
    UALoginUserName = 1, //用户名密码
    UALoginSMSCode  = 2, //短信验证码
    UALoginGA       = 3, //网关取号
    UALoginSMSUp    = 4, //短信上行
};

/**
 网络类型
 */
typedef NS_ENUM(NSInteger, UANetworkType) {
    UANetworkNO   = 0,     //没有网络
    UANetworkWWAN = 1,     //数据流量
    UANetworkWIFI = 2,     //WIFI
};

/**
 供应商类型
 */
typedef NS_ENUM(NSInteger, UAOperateType) {
    UAOperateUnkown = 0,   //未知
    UAOperateCMCC = 1,     //中国移动
    UAOperateUnicom = 2,   //中国联通
    UAOperateTelecom = 3   //中国电信
};

/**
 错误码
 */
typedef NS_ENUM(NSInteger,ErrorCode) {
    ErrorCode_NoNet = 102101,     //没有网络
    ErrorCode_NotWWAN = 102103,   //非移动网络
    ErrorCode_Network = 102109,   //网络错误
    ErrorCode_Middleware = 102207,//获取的中间件值错误
    ErrorCode_ErrArg = 102208,    //参数错误
    ErrorCode_NoSim  = 102209,    //没有sim卡
    ErrorCode_Simulator = 102210, //不支持短信发送
    ErrorCode_Cancel = 102301,    //用户取消登录

};

#define SUCCESSCODE @"103000"

#endif /* UAEnum_h */
