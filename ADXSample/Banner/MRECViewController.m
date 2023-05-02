//
//  MRECViewController.m
//  ADXSample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import "MRECViewController.h"

#import <ADXLibrary/ADXAdView.h>

@interface MRECViewController () <ADXAdViewDelegate>

@property (strong) ADXAdView *adView;

@end

@implementation MRECViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.adView = [[ADXAdView alloc] initWithAdUnitId:ADX_MREC_AD_UNIT_ID
                                               adSize:ADXAdSizeMediumRectangle
                                   rootViewController:self];
    
    [self.adView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.adView.delegate = self;
    [self.view addSubview:self.adView];
    [NSLayoutConstraint activateConstraints:@[
        [_adView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [_adView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [_adView.widthAnchor constraintEqualToConstant:ADXAdSizeMediumRectangle.width],
        [_adView.heightAnchor constraintEqualToConstant:ADXAdSizeMediumRectangle.height],
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

