//
//  ZZSplashToutiaoAd.m
//  AdSdk
//
//  Created by donews on 2018/12/10.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZZSplashToutiaoAd.h"
#import <WMAdSDK/WMAdSDKManager.h>
#import <WMAdSDK/WMSplashAdView.h>

@interface ZZSplashToutiaoAd() <WMSplashAdDelegate>


@property (nonatomic, strong) WMSplashAdView *spalshView;
@property (nonatomic, strong) UIWindow *window;

@end

@implementation ZZSplashToutiaoAd

- (void)loadAdAndShowInWindow:(id)window withBottomView:(id)bottomView {
    
    [WMAdSDKManager setAppID:@"5000546"];
    [WMAdSDKManager setIsPaidApp:NO];
    [WMAdSDKManager setLoglevel:WMAdSDKLogLevelDebug];
    NSLog(@"SDKVersion = %@", [WMAdSDKManager SDKVersion]);
    
    
    CGRect adFrame = [UIScreen mainScreen].bounds;
    
    // frame 强烈建议为屏幕大小
    WMSplashAdView *spalshView = [[WMSplashAdView alloc] initWithSlotID:@"800546808" frame:adFrame];
    // tolerateTimeout = CGFLOAT_MAX 转化为毫秒会溢出，等效于0 ， 默认tolerateTimeout = 0.5s
    spalshView.tolerateTimeout = 3;
    
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:@"launchimage_1125x2436.png" ofType:nil inDirectory:@"AdDemo.bundle"];
    
    UIImage *backgroundImage = [UIImage imageWithContentsOfFile:path];
    UIColor *backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    spalshView.backgroundColor = backgroundColor;
    spalshView.delegate = self;
    
    [window addSubview:spalshView];
    [window addSubview:bottomView];
    [spalshView loadAdData];
    self.window = window;
    
}

#pragma mark - Getters & Setters
- (void)spalshAdDidLoad:(WMSplashAdView *)spalshAd {
    NSLog(@"@@@@@@@@成功@@@@@@@");
}

- (void)spalshAdWillVisible:(WMSplashAdView *)spalshAd {
    NSLog(@"");
}

- (void)spalshAdDidClick:(WMSplashAdView *)spalshAd {
    
}

- (void)spalshAdDidClose:(WMSplashAdView *)spalshAd {
    [spalshAd removeFromSuperview];
    self.window.hidden = YES;
    
}

- (void)spalshAdWillClose:(WMSplashAdView *)spalshAd {
    
}

- (void)spalshAd:(WMSplashAdView *)spalshAd didFailWithError:(NSError *)error {
    [spalshAd removeFromSuperview];
    self.window.hidden = YES;
    NSLog(@"@@@@@@@@失败@@@@@@@");
}



@end
