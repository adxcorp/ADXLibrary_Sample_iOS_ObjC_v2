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
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // 프로그래밍 방식으로 수동으로 ATT (App Tracking Transparency) 동의 요청 할 경우에만, 아래 코드를 사용.
    // [self requestIDFA];
    
    // 애드몹 UMP (User Messaging Platform)의 IDFA 메시지를 통한 ATT (App Tracking Transparency) 동의 요청 권장
    // 참조 링크: https://docs.adxcorp.kr/appendix/ump-user-messaging-platform
}

- (void)requestTrackingPermission:(void (^)(BOOL granted))completion {
   if (@available(iOS 14, *)) { } else {
       dispatch_async(dispatch_get_main_queue(), ^{
           if (completion) completion(YES);
       });
       return;
   }

   ATTrackingManagerAuthorizationStatus status = ATTrackingManager.trackingAuthorizationStatus;
   if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
       dispatch_async(dispatch_get_main_queue(), ^{
           if (completion) completion(YES);
       });
       return;
   } else if (status == ATTrackingManagerAuthorizationStatusDenied ||
              status == ATTrackingManagerAuthorizationStatusRestricted) {
       dispatch_async(dispatch_get_main_queue(), ^{
           if (completion) completion(NO);
       });
       return;
   }

   void (^requestBlock)(void) = ^{
       [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
           dispatch_async(dispatch_get_main_queue(), ^{
               if (completion) completion(status == ATTrackingManagerAuthorizationStatusAuthorized);
           });
       }];
   };

   if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {
       requestBlock();
       return;
   }

   __block id observer = nil;
   observer = [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidBecomeActiveNotification
                                                                object:nil
                                                                 queue:[NSOperationQueue mainQueue]
                                                            usingBlock:^(NSNotification * _Nonnull note) {
       if (observer) {
           [[NSNotificationCenter defaultCenter] removeObserver:observer];
           observer = nil;
       }
       requestBlock();
   }];
}

@end
