//
//  MRECViewController.m
//  ADXSample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import "MRECViewController.h"

#import <ADXLibrary/ADXAdView.h>

@interface MRECViewController () <ADXAdViewDelegate>

@property (nonatomic, strong) ADXAdView *adView;

@end

@implementation MRECViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.adView = [[ADXAdView alloc] initWithAdUnitId:ADX_MREC_AD_UNIT_AD
                                               adSize:ADXAdSizeMediumRectangle
                                   rootViewController:self];
    self.adView.delegate = self;
    self.adView.frame = CGRectMake((self.view.bounds.size.width - ADXAdSizeMediumRectangle.width) / 2,
                                   0,
                                   ADXAdSizeMediumRectangle.width,
                                   ADXAdSizeMediumRectangle.height);
    
    [self.view addSubview:self.adView];
    [self.adView loadAd];
}

#pragma mark - ADXAdViewDelegate

- (void)adViewDidLoad:(ADXAdView *)bannerView {
    NSLog(@"adViewDidLoad");
}

- (void)adView:(ADXAdView *)bannerView didFailToLoadWithError:(NSError *)error {
    NSLog(@"adView:didFailToLoadWithError: %@", error);
    
}
- (void)adViewDidClick:(ADXAdView *)bannerView {
    NSLog(@"adViewDidClick");
}

@end

