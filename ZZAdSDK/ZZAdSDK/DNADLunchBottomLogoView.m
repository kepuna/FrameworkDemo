//
//  DNADLunchBottomLogoView.m
//  DNAdSDK
//
//  Created by donews on 2018/10/12.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "DNADLunchBottomLogoView.h"

@interface DNADLunchBottomLogoView()

@property (nonatomic, strong) UIImageView *logoImageView;

@end

@implementation DNADLunchBottomLogoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.logoImageView];
    }
    return self;
}

- (UIImageView *)logoImageView {
    if (_logoImageView == nil) {
        _logoImageView = [[UIImageView alloc] init];
        _logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _logoImageView;
}

- (void)setLogoImage:(UIImage *)logoImage {
    self.logoImageView.image = logoImage;
    self.logoImageView.frame = CGRectMake((self.frame.size.width - logoImage.size.width) * 0.5 , (self.frame.size.height - logoImage.size.height) * 0.5, logoImage.size.width, logoImage.size.height);
}

@end
