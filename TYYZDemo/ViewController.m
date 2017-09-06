//
//  ViewController.m
//  TYYZDemo
//
//  Created by 嚼华先森 on 2017/8/30.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "ViewController.h"
#import <TYRZSDK/TYRZSDK.h>
#define LZHFormatString(...) [NSString stringWithFormat: __VA_ARGS__]
#define LZHCustomLog(msg, ...) NSLog(@"%@: %@, 第%d行", msg, LZHFormatString(__VA_ARGS__), __LINE__)
#define LZHLogObject(obj) NSLog(@"对象：%@, 行：%d", obj, __LINE__)
//#define SUCCESSCODE @"102000"

#define APPID @"300011014649"
#define APPKEY @"14A4F9506A81D97F4D76772FBB3273E7"
#import "UAEnum.h"

@interface ViewController ()
@property (nonatomic,strong) NSString * token;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [TYRZBaseApi customInit:APPID clientSecret:APPKEY redirectURL:nil];
    
    NSArray *titles = @[@"隐式登录",@"短信登录界面",@"显式登录",@"清理所有缓存",@"校验token"];
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.view addSubview:({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame = (CGRect){(self.view.bounds.size.width-120)/2,64+idx*40,120,40};
            [button setTitle:obj forState:UIControlStateNormal];
            button.tag = idx;
            [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            button;
        })];
    }];
    
}

-(void)btnAction:(UIButton *)sender{
    
    switch (sender.tag) {
        case 0:
        {
            [TYRZLogin loginImplicitly:^(id sender) {
               LZHCustomLog(@"%@",@"隐式登录:%@",sender);
                NSString *resultCode = sender[@"resultCode"];
                self.token = sender[@"tokesn"];
                NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:sender];
                if ([resultCode isEqualToString:SUCCESSCODE]) {
                    result[@"result"] = @"获取token成功";
                } else {
                    result[@"result"] = @"获取token失败";
                }
                [self presentMessage:result];
            }];
        }
            break;
        case 1:
        {
            [TYRZUILogin loginSMS:self complete:^(id sender) {
                LZHCustomLog(@"%@",@"=open=短信验证码登录:%@",sender);
                NSString *resultCode = sender[@"resultCode"];
                self.token = sender[@"token"];
                NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:sender];
                if ([resultCode isEqualToString:SUCCESSCODE]) {
                    result[@"result"] = @"获取token成功";
                } else {
                    result[@"result"] = @"获取token失败";
                }
                [self presentMessage:result];
            }];
        }
            break;
        case 2:
        {
            [TYRZUILogin loginExplicitly:self complete:^(id sender) {
                LZHCustomLog(@"%@",@"显示登录:%@",sender);
                NSString *resultCode = sender[@"resultCode"];
                self.token = sender[@"token"];
                NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:sender];
                if ([resultCode isEqualToString:SUCCESSCODE]) {
                    result[@"result"] = @"获取token成功";
                } else {
                    result[@"result"] = @"获取token失败";
                }
                [self presentMessage:result];
            }];

        }
            break;
        case 3:
        {
            [TYRZBaseApi cleanAccount];
            LZHLogObject(@"清理所有缓存");
        }
            break;
        case 4:
        {
            [TYRZBaseApi checkToken:self.token complete:^(id sender) {
                LZHLogObject(@"校验token");
                NSDictionary *header = sender[@"header"];
                if (header != nil) {
                    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:sender];
                    NSString *resultCode = header[@"resultcode"];
                    if ([resultCode isEqualToString:SUCCESSCODE]) {
                        result[@"result"] = @"校验token成功";
                    } else {
                        result[@"result"] = @"校验token失败";
                    }
                    [self presentMessage:result];
                } else {
                    [self presentMessage:sender];
                }
            }];

        }
        default:
            break;
    }
}

//警示框
- (void)presentMessage:(NSDictionary *)sender {
    NSString *message = [self changeShowMessage:sender];
    UIAlertController *VC = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"%@",message] preferredStyle:UIAlertControllerStyleAlert];
    [VC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:VC animated:YES completion:nil];
    
}

//转换显示资料
- (NSString *)changeShowMessage:(id)sender {
    NSString *message = @"";
    for (id key in [sender allKeys]) {
        message = [message stringByAppendingFormat:@"\n%@ = \"%@\"",key,sender[key]];
    }
    return message;
}




@end
