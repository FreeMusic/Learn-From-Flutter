//
//  FlutterInitiativeCalliOS.m
//  Runner
//
//  Created by 吴高翔 on 2020/5/19.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlutterInitiativeCalliOS.h"
#import "LZYPAlertController.h"
#import "NewPushViewController.h"

static NSString *flutterMethodChannel = @"lexiaoyao";//Flutter和iOS交互信号
static NSString *flutterCallAlertMethod = @"WeAreVeryHappy";//Flutter调用iOS提示框方法
static NSString *pushNewViewController = @"pushNewViewController";//Flutter跳转iOS原生控制器

@interface FlutterInitiativeCalliOS ()

@property (nonatomic, strong) NSDictionary *keyValues;///

@end

@implementation FlutterInitiativeCalliOS

- (instancetype)init{
    if (self = [super init]) {
        
        self.keyValues = @{
            
        };
        
    }
    
    return self;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar{
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:flutterMethodChannel binaryMessenger:[registrar messenger]];
    FlutterInitiativeCalliOS *instance = [[self alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    if ([call.method isEqualToString:flutterCallAlertMethod]) {
        //弹窗
        [LZYPAlertController initActionAlertWithTitle:@"交互成功" message:@"Flutter主动调用了iOS的弹窗" presentVC:[self viewController]];
    }else if ([call.method isEqualToString:pushNewViewController]){
        ///跳转页面
        NewPushViewController *newVC = [[NewPushViewController alloc] init];
//        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:self];
//        [navi pushViewController:newVC animated:YES];
//        [[self viewController] presentViewController:newVC animated:YES completion:^{
//            [[self viewController] dismissViewControllerAnimated:YES completion:^{
//
//            }];
//        }];
    }else{
        result(FlutterMethodNotImplemented);
    }
}

- (UIViewController *)viewController{
    return [UIApplication sharedApplication].keyWindow.rootViewController;
}

@end
