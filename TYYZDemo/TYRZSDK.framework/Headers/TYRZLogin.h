//
//  TYRZLogin.h
//  TYRZ
//
//  Created by 林涛 on 2017/4/24.
//  Copyright © 2017年 林涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void(^UAFinishBlock)(id sender);

@interface TYRZLogin : NSObject


/**
 隐式登录
 */
+ (void)loginImplicitly:(void (^)(id sender))complete;
@end
