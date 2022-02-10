//
//  ADXInterstitialViewController.m
//  ADXExample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import "ADXInterstitialViewController.h"

#import <ADXLibrary/ADXInterstitialAd.h>

@interface ADXInterstitialViewController () <ADXInterstitialAdDelegate>

@property (nonatomic, strong) ADXInterstitialAd *intersititalAd;

@end

@implementation ADXInterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.intersititalAd = [[ADXInterstitialAd alloc] initWithAdUnitId:ADX_INTERSTITIAL_AD_UNIT_ID];
    self.intersititalAd.delegate = self;
}

- (IBAction)loadAd:(id)sender {
    [self.intersititalAd loadAd];
}

- (IBAction)showAd:(id)sender {
    if (self.intersititalAd.isLoaded) {
        [self.intersititalAd showAdFromRootViewController:self];
    }
}

#pragma mark - ADXInterstitialAdDelegate

- (void)interstitialAdDidLoad:(ADXInterstitialAd *)interstitial {
    NSLog(@"interstitialDidLoadAd");
}

- (void)interstitialAd:(ADXInterstitialAd *)interstitialAd didFailToLoadAdWithError:(NSError *)error {
    NSLog(@"interstitial:didFailToLoadAdWithError: %@", error);
}

- (void)interstitialAd:(ADXInterstitialAd *)interstitialAd didFailToShowWithError:(NSError *)error {
    NSLog(@"interstitial:didFailToShowWithError: %@", error);
}

- (void)interstitialAdWillPresentScreen:(ADXInterstitialAd *)interstitialAd {
    NSLog(@"interstitialAdWillPresentScreen");
}

- (void)interstitialAdWillDismissScreen:(ADXInterstitialAd *)interstitialAd {
    NSLog(@"interstitialAdWillDismissScreen");
}

- (void)interstitialAdDidDismissScreen:(ADXInterstitialAd *)interstitialAd {
    NSLog(@"interstitialAdDidDismissScreen");
}

- (void)interstitialAdDidClick:(ADXInterstitialAd *)interstitialAd {
    NSLog(@"interstitialAdDidClick");
}

@end
