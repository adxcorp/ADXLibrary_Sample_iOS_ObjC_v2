//
//  InterstitialViewController.m
//  ADXSample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import "InterstitialViewController.h"

#import <ADXLibrary/ADXInterstitialAd.h>

@interface InterstitialViewController () <ADXInterstitialAdDelegate>

@property (strong) ADXInterstitialAd *interstitialAd;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interstitialAd = [[ADXInterstitialAd alloc] initWithAdUnitId:ADX_INTERSTITIAL_AD_UNIT_ID];
    self.interstitialAd.delegate = self;
}

- (IBAction)loadAd:(id)sender {
    [self.interstitialAd loadAd];
}

- (IBAction)showAd:(id)sender {
    if (self.interstitialAd.isLoaded) {
        [self.interstitialAd showAdFromRootViewController:self];
    }
}

#pragma mark - ADXInterstitialAdDelegate

- (void)interstitialAdDidLoad:(ADXInterstitialAd *)interstitial {
    NSLog(@"interstitialAdDidLoad");
}

- (void)interstitialAd:(ADXInterstitialAd *)interstitialAd didFailToLoadWithError:(NSError *)error {
    NSLog(@"interstitialAd:didFailToLoadWithError: %@", error);
}

- (void)interstitialAd:(ADXInterstitialAd *)interstitialAd didFailToShowWithError:(NSError *)error {
    NSLog(@"interstitialAd:didFailToShowWithError: %@", error);
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
