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
    self.adView.delegate = self;
    self.adView.frame = CGRectMake((self.view.bounds.size.width - ADXAdSizeBanner.width) / 2,
                                   0,
                                   ADXAdSizeBanner.width,
                                   ADXAdSizeBanner.height);
    
    [self.view addSubview:self.adView];
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
