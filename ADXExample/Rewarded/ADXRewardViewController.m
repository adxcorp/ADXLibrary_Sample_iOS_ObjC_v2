//
//  ADXRewardViewController.m
//  ADXExample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import "ADXRewardViewController.h"

#import <ADXLibrary/ADXRewardedAd.h>

@interface ADXRewardViewController () <ADXRewardedAdDelegate>

@property (nonatomic, strong) ADXRewardedAd *rewardedAd;

@end

@implementation ADXRewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rewardedAd = [[ADXRewardedAd alloc] initWithAdUnitId:ADX_REWARDED_AD_UNIT_ID];
    self.rewardedAd.delegate = self;
}

- (void)loadRewardedAd {
    [self.rewardedAd loadAd];
}

- (IBAction)loadAd:(id)sender {
    [self loadRewardedAd];
}

- (IBAction)showAd:(id)sender {
    if (self.rewardedAd.isLoaded) {
        [self.rewardedAd showAdFromRootViewController:self];
    }
}

#pragma mark - ADXRewardedAdDelegate

- (void)rewardedAdDidLoad:(ADXRewardedAd *)rewardedAd {
    NSLog(@"rewardedAdDidLoad");
}

- (void)rewardedAd:(ADXRewardedAd *)rewardedAd didFailToLoadAdWithError:(NSError *)error {
    NSLog(@"rewardedAd:didFailToLoadAdWithError: %@", error);
}

- (void)rewardedAd:(ADXRewardedAd *)rewardedAd didFailToShowWithError:(NSError *)error {
    NSLog(@"rewardedAd:didFailToShowWithError: %@", error);
}
- (void)rewardedAdWillPresentScreen:(ADXRewardedAd *)rewardedAd {
    NSLog(@"rewardedAdWillPresentScreen");
}

- (void)rewardedAdDidClick:(ADXRewardedAd *)rewardedAd {
    NSLog(@"rewardedAdDidClick");
}

- (void)rewardedAdWillDismissScreen:(ADXRewardedAd *)rewardedAd {
    NSLog(@"rewardedAdWillDismissScreen");
}

- (void)rewardedAdDidDismissScreen:(ADXRewardedAd *)rewardedAd {
    NSLog(@"rewardedAdDidDismissScreen");
}

- (void)rewardedAdDidRewardUser:(ADXRewardedAd *)rewwaredAd withReward:(ADXReward *)reward {
    NSLog(@"rewardedAdDidRewardUser");
}

@end
