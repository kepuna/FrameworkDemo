//
//  DNADLaunch.m
//  DNAdSDK
//
//  Created by donews on 2018/10/9.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "DNADLaunch.h"
#import <UIKit/UIKit.h>
#import "DNADLunchBottomLogoView.h"
#import "DNConst.h"
//#import <JHAdSDK/DNSplashAd.h>
//#import "ZZSplashAd.h"
//#import "ZZSplashGDTAd.h"
#import "ZZSplashToutiaoAd.h"



#define IS_IPHONEX (([[UIScreen mainScreen] nativeBounds].size.height-2436)?NO:YES)

@interface DNADLaunch()

@property (nonatomic, strong) UIWindow* window;
//@property (nonatomic, strong) ZZSplashAd *slashAd;
@property (nonatomic, strong) ZZSplashToutiaoAd *slashAd;

@end

@implementation DNADLaunch

///在load 方法中，启动监听，可以做到无注入
+ (void)load
{
    [self shareInstance];
}

+ (instancetype)shareInstance
{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        ///如果是没啥经验的开发，请不要在初始化的代码里面做别的事，防止对主线程的卡顿，和 其他情况
        ///应用启动, 首次开屏广告
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            ///要等DidFinished方法结束后才能初始化UIWindow，不然会检测是否有rootViewController
//            [self checkAD];
            [self launchTest];
        }];
        ///进入后台
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            self.window.hidden = YES;
//            [self request];
        }];
        ///后台启动,二次开屏广告
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationWillEnterForegroundNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
//            [self checkAD];
            [self launchTest]; 
        }];
    }
    return self;
}

- (void)launchTest {
    
    ///初始化一个Window， 做到对业务视图无干扰
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [UIViewController new];
    window.rootViewController.view.backgroundColor = [UIColor clearColor];
    window.rootViewController.view.userInteractionEnabled = NO;
    
    [self setupSubviews:window]; // 广告控件布局
    window.windowLevel = UIWindowLevelStatusBar + 1;// 设置为最顶层，防止 AlertView 等弹窗的覆盖
    window.hidden = NO; // 默认为YES，当你设置为NO时，这个Window就会显示了
    window.alpha = 1;
    self.window = window; //防止释放，显示完后要手动设置为 nil
}


- (void)setupSubviews:(UIWindow*)window {
    
    self.slashAd = [[ZZSplashToutiaoAd alloc] init];
    
//    self.slashAd = [[DNSplashAd alloc] init];
//    self.slashAd.tolerateTimeout = 3;
//    self.slashAd.delegate = self;
//    self.slashAd.backgroundImage = [UIImage imageNamed:@"launchimage_1125x2436"];
//
    CGFloat height = 140;
    CGRect frame = CGRectMake(0, window.bounds.size.height - height, window.bounds.size.width, height);
    DNADLunchBottomLogoView *bottomLogoView = [[DNADLunchBottomLogoView alloc] initWithFrame:frame];
    bottomLogoView.logoImage = [UIImage imageNamed:@"launch_logo"];
    bottomLogoView.backgroundColor = [UIColor whiteColor];
    [self.slashAd loadAdAndShowInWindow:window withBottomView:bottomLogoView];
}

@end
