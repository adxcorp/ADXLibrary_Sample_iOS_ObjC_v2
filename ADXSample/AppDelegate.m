//
//  AppDelegate.m
//  ADXSample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import "AppDelegate.h"

#import <ADXLibrary/ADXLibrary.h>

#import <FBAudienceNetwork/FBAdSettings.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // ADX SDK Initialize
    ADXConfiguration *configuration = [[ADXConfiguration alloc] initWithAppId:ADX_APP_ID
                                                                     gdprType:ADXGdprTypePopupLocation];
    configuration.logLevel = ADXLogLevelDebug;
    [[ADXSdk sharedInstance] initializeWithConfiguration:configuration
                                       completionHandler:^(BOOL result, ADXConsentState consentState) {
        NSLog(@"ADX Sdk Initialize");
    }];
    
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *navigationBarAppearance = [[UINavigationBarAppearance alloc] init];
        [navigationBarAppearance configureWithOpaqueBackground];
        navigationBarAppearance.backgroundColor = [UIColor whiteColor];
        [navigationBarAppearance setTitleTextAttributes: @{ NSForegroundColorAttributeName: [UIColor blackColor] }];
        
        UINavigationBar.appearance.standardAppearance = navigationBarAppearance;
        UINavigationBar.appearance.scrollEdgeAppearance = navigationBarAppearance;
        UINavigationBar.appearance.translucent = NO;
    }
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self requestIDFA];
}

- (void)requestIDFA {
    if (@available(iOS 14, *)) {
        // ATT 알림을 통한 권한 요청
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            
            // 광고추적제한 설정 (페이스북 광고)
            if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
                [FBAdSettings setAdvertiserTrackingEnabled:YES];
            } else {
                [FBAdSettings setAdvertiserTrackingEnabled:NO];
            }
        }];
    }
}

@end
