//
//  AdMobRewardedViewController.m
//  ADXSample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import "AdMobRewardedViewController.h"
#import <ADXLibrary/ADXGdprManager.h>

@import GoogleMobileAds;

@interface AdMobRewardedViewController () <GADFullScreenContentDelegate>

@property(nonatomic, strong) GADRewardedAd *rewardedAd;

@end

@implementation AdMobRewardedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createAndLoadRewardedAd];
}

- (IBAction)loadAd:(id)sender {
    [self createAndLoadRewardedAd];
}

- (IBAction)showAd:(id)sender {
    if (self.rewardedAd) {
        [self.rewardedAd presentFromRootViewController:self userDidEarnRewardHandler:^{
            GADAdReward *reward = self.rewardedAd.adReward;
            if (reward != nil) {
                NSLog(@"Reward received with currency: %@, amount: %@", reward.type, reward.amount);
            }
        }];
    } else {
        [self createAndLoadRewardedAd];
    }
}

- (void)createAndLoadRewardedAd {
    GADRequest *request = [GADRequest request];
    //*** GDPR
    if ([ADXGdprManager sharedInstance].consentState == ADXConsentStateDenied) {
        GADExtras *extras = [[GADExtras alloc] init];
        extras.additionalParameters = @{@"npa": @"1"};
        [request registerAdNetworkExtras:extras];
    }
    
    [GADRewardedAd loadWithAdUnitID:ADMOB_REWARDED_AD_UNIT_ID request:request completionHandler:^(GADRewardedAd *rewardedAd, NSError *error) {
        if (error) {
            NSLog(@"Loading failed");
        } else {
            NSLog(@"Loading Succeeded");
            self.rewardedAd = rewardedAd;
            self.rewardedAd.fullScreenContentDelegate = self;
        }
    }];
}


#pragma mark - GADFullScreenContentDelegate

- (void)adDidRecordImpression:(id<GADFullScreenPresentingAd>)ad {
    NSLog(@"adDidRecordImpression");
}

- (void)ad:(id<GADFullScreenPresentingAd>)ad didFailToPresentFullScreenContentWithError:(NSError *)error {
    NSLog(@"Rewarded ad failed to present.");
}

- (void)adDidPresentFullScreenContent:(id<GADFullScreenPresentingAd>)ad {
    NSLog(@"Rewarded ad presented");
}

- (void)adDidDismissFullScreenContent:(id<GADFullScreenPresentingAd>)ad {
    NSLog(@"adDidDismissFullScreenContent");
}

@end
