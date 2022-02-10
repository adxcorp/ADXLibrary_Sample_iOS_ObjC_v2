//
//  ADXBannerViewController.m
//  ADXExample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import "ADXBannerViewController.h"

#import <ADXLibrary/ADXAdView.h>

@interface ADXBannerViewController () <ADXAdViewDelegate>

@property (nonatomic, strong) ADXAdView *adView;

@end

@implementation ADXBannerViewController

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

- (void)adViewDidLoad:(ADXAdView *)bannerView {
    NSLog(@"adViewDidLoad");
}

- (void)adView:(ADXAdView *)bannerView didFailToLoadWithError:(NSError *)error {
    NSLog(@"adViewDidFailToLoadWithError: %@", error);
    
}
- (void)adViewDidClick:(ADXAdView *)bannerView {
    NSLog(@"adViewDidClick");
}

@end
