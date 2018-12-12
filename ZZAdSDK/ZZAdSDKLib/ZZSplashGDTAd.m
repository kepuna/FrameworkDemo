//
//  ZZSplashGDTAd.m
//  AdSdk
//
//  Created by donews on 2018/12/10.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZZSplashGDTAd.h"
#import "GDTSplashAd.h"

@interface ZZSplashGDTAd()<GDTSplashAdDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) GDTSplashAd *splashAd;

@end

@implementation ZZSplashGDTAd

- (void)loadAdAndShowInWindow:(UIWindow *)window withBottomView:(UIView *)bottomView {
    
    GDTSplashAd *splashAd = [[GDTSplashAd alloc] initWithAppId:@"1105344611" placementId:@"9040714184494018"];
    splashAd.delegate = self;
    splashAd.fetchDelay = 3;
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:@"launchimage_1125x2436.png" ofType:nil inDirectory:@"AdDemo.bundle"];
    UIImage *backgroundImage = [UIImage imageWithContentsOfFile:path];
    splashAd.backgroundImage = backgroundImage;
    [splashAd loadAdAndShowInWindow:window withBottomView:bottomView skipView:nil];
    self.window = window;
    self.splashAd = splashAd;
}


- (void)splashAdSuccessPresentScreen:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)splashAdFailToPresent:(GDTSplashAd *)splashAd withError:(NSError *)error
{
    NSLog(@"%s%@",__FUNCTION__,error);
}

- (void)splashAdExposured:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)splashAdClicked:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)splashAdApplicationWillEnterBackground:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)splashAdWillClosed:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)splashAdClosed:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
    self.splashAd = nil;
}

- (void)splashAdWillPresentFullScreenModal:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)splashAdDidPresentFullScreenModal:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)splashAdWillDismissFullScreenModal:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)splashAdDidDismissFullScreenModal:(GDTSplashAd *)splashAd
{
    NSLog(@"%s",__FUNCTION__);
}


@end
