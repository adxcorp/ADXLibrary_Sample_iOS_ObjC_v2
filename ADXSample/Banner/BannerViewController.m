//
//  BannerViewController.m
//  ADXSample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import "BannerViewController.h"

#import <ADXLibrary/ADXAdView.h>

@interface BannerViewController () <ADXAdViewDelegate>

@property (strong) ADXAdView *adView;

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.adView = [[ADXAdView alloc] initWithAdUnitId:ADX_BANNER_AD_UNIT_AD
                                               adSize:ADXAdSizeBanner
                                   rootViewController:self];
    
    [self.adView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.adView.delegate = self;
    [self.view addSubview:self.adView];
    [NSLayoutConstraint activateConstraints:@[
        [_adView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [_adView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
        [_adView.widthAnchor constraintEqualToConstant:ADXAdSizeBanner.width],
        [_adView.heightAnchor constraintEqualToConstant:ADXAdSizeBanner.height],
    ]];
    [self.adView loadAd];
}

#pragma mark - ADXAdViewDelegate

- (void)adViewDidLoad:(ADXAdView *)adView {
    NSLog(@"adViewDidLoad");
}

- (void)adView:(ADXAdView *)adView didFailToLoadWithError:(NSError *)error {
    NSLog(@"adView:didFailToLoadWithError: %@", error);
    
}
- (void)adViewDidClick:(ADXAdView *)adView {
    NSLog(@"adViewDidClick");
}

@end
