//
//  NativeViewController.m
//  ADXSample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import "NativeViewController.h"
#import "NativeAdView.h"

#import <ADXLibrary/ADXNativeAdFactory.h>

@interface NativeViewController () <ADXNativeAdFactoryDelegate, ADXNativeAdDelegate>

@property (strong) ADXNativeAd *nativeAd;

@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[ADXNativeAdFactory sharedInstance] setRenderingViewClass:ADX_NATIVE_AD_UNIT_ID renderingViewClass:[NativeAdView class]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [[ADXNativeAdFactory sharedInstance] addDelegate:self];
    [[ADXNativeAdFactory sharedInstance] loadAd:ADX_NATIVE_AD_UNIT_ID];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[ADXNativeAdFactory sharedInstance] removeDelegate:self];
}


#pragma mark - ADXNativeAdFactoryDelegate

- (void)onSuccess:(NSString *)adUnitId nativeAd:(ADXNativeAd *)nativeAd {
    NSLog(@"onSuccess : %@", adUnitId);

    if([adUnitId isEqualToString:ADX_NATIVE_AD_UNIT_ID]) {
        self.nativeAd = nativeAd;
        self.nativeAd.delegate = self;

        UIView *nativeAdView = [[ADXNativeAdFactory sharedInstance] getNativeAdView:ADX_NATIVE_AD_UNIT_ID];

        nativeAdView.frame = CGRectMake((self.view.bounds.size.width - 320.0)/2,
                                        100.0,
                                        320.0,
                                        300.0);
        [self.view addSubview:nativeAdView];
    }
}

- (void)onFailure:(NSString *)adUnitId {
    NSLog(@"onFailure : %@", adUnitId);
}


#pragma mark - ADXNativeAdDelegate

- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}

@end
