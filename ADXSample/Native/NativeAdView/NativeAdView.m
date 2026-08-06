//
//  NativeAdView.m
//  ADXSample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import "NativeAdView.h"

@implementation NativeAdView

- (instancetype)init {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];

    UIImageView *iconImageView = [UIImageView new];
    iconImageView.userInteractionEnabled = NO;
    iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:iconImageView];
    self.iconImageView = iconImageView;

    UILabel *titleLabel = [UILabel new];
    titleLabel.userInteractionEnabled = NO;
    titleLabel.text = @"Title";
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;

    UIButton *callToActionButton = [UIButton buttonWithType:UIButtonTypeSystem];
    callToActionButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [callToActionButton setTitle:@"Call To Action" forState:UIControlStateNormal];
    callToActionButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:callToActionButton];
    self.callToActionButton = callToActionButton;

    UIImageView *privacyInformationIconImageView = [UIImageView new];
    privacyInformationIconImageView.userInteractionEnabled = NO;
    privacyInformationIconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:privacyInformationIconImageView];
    self.privacyInformationIconImageView = privacyInformationIconImageView;

    UIImageView *mainImageView = [UIImageView new];
    mainImageView.userInteractionEnabled = NO;
    mainImageView.clipsToBounds = YES;
    mainImageView.contentMode = UIViewContentModeScaleAspectFill;
    mainImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:mainImageView];
    self.mainImageView = mainImageView;

    UILabel *mainTextLabel = [UILabel new];
    mainTextLabel.userInteractionEnabled = NO;
    mainTextLabel.text = @"Main";
    mainTextLabel.textColor = [UIColor blackColor];
    mainTextLabel.font = [UIFont systemFontOfSize:14];
    mainTextLabel.numberOfLines = 0;
    mainTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:mainTextLabel];
    self.mainTextLabel = mainTextLabel;

    UIView *adTagView = [UIView new];
    adTagView.backgroundColor = [UIColor systemOrangeColor];
    adTagView.layer.cornerRadius = 5;
    adTagView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:adTagView];

    UILabel *adTagLabel = [UILabel new];
    adTagLabel.userInteractionEnabled = NO;
    adTagLabel.text = @"Ad";
    adTagLabel.textAlignment = NSTextAlignmentCenter;
    adTagLabel.textColor = [UIColor whiteColor];
    adTagLabel.font = [UIFont systemFontOfSize:17];
    adTagLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [adTagView addSubview:adTagLabel];

    [NSLayoutConstraint activateConstraints:@[
        /// Icon Image View
        [iconImageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
        [iconImageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:24],
        [iconImageView.widthAnchor constraintEqualToConstant:60],
        [iconImageView.widthAnchor constraintEqualToAnchor:iconImageView.heightAnchor multiplier:1],

        /// Title Label
        [titleLabel.leadingAnchor constraintEqualToAnchor:iconImageView.trailingAnchor constant:10],
        [titleLabel.topAnchor constraintEqualToAnchor:iconImageView.topAnchor],

        /// Privacy Information Icon Image View
        [privacyInformationIconImageView.leadingAnchor constraintEqualToAnchor:titleLabel.trailingAnchor constant:5],
        [privacyInformationIconImageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10],
        [privacyInformationIconImageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:24],
        [privacyInformationIconImageView.widthAnchor constraintEqualToConstant:20],
        [privacyInformationIconImageView.widthAnchor constraintEqualToAnchor:privacyInformationIconImageView.heightAnchor multiplier:1],

        /// Call To Action Button
        [callToActionButton.leadingAnchor constraintEqualToAnchor:titleLabel.leadingAnchor],
        [callToActionButton.topAnchor constraintEqualToAnchor:titleLabel.bottomAnchor],
        [callToActionButton.bottomAnchor constraintEqualToAnchor:iconImageView.bottomAnchor],
        [callToActionButton.heightAnchor constraintEqualToConstant:30],
        [self.trailingAnchor constraintGreaterThanOrEqualToAnchor:callToActionButton.trailingAnchor constant:10],

        /// Main Image View
        [mainImageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
        [mainImageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10],
        [mainImageView.topAnchor constraintEqualToAnchor:iconImageView.bottomAnchor constant:10],
        [mainImageView.widthAnchor constraintEqualToAnchor:mainImageView.heightAnchor multiplier:2],

        /// Main Text Label
        [mainTextLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
        [mainTextLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10],
        [mainTextLabel.topAnchor constraintEqualToAnchor:mainImageView.bottomAnchor constant:5],
        [mainTextLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-5],

        /// AdTag View
        [adTagView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
        [adTagView.topAnchor constraintEqualToAnchor:self.topAnchor constant:2],
        [adTagView.widthAnchor constraintEqualToConstant:30],
        [adTagView.heightAnchor constraintEqualToConstant:20],
        [adTagLabel.centerXAnchor constraintEqualToAnchor:adTagView.centerXAnchor],
        [adTagLabel.centerYAnchor constraintEqualToAnchor:adTagView.centerYAnchor],
    ]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}


#pragma mark - ADXNativeAdRendering

- (UILabel *)nativeMainTextLabel {
    return self.mainTextLabel;
}

- (UILabel *)nativeTitleTextLabel {
    return self.titleLabel;
}

- (UIButton *)nativeCallToActionButton {
    return self.callToActionButton;
}

- (UIImageView *)nativeIconImageView {
    return self.iconImageView;
}

- (UIImageView *)nativeMainImageView {
    return self.mainImageView;
}

- (UIImageView *)nativePrivacyInformationIconImageView {
    return self.privacyInformationIconImageView;
}

@end
