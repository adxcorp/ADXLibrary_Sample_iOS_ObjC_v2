//
//  NativeAdView.h
//  ADXSample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ADXLibrary/ADXNativeAdRendering.h>

@interface NativeAdView : UIView <ADXNativeAdRendering>

@property (weak) IBOutlet UILabel *titleLabel;
@property (weak) IBOutlet UILabel *mainTextLabel;
@property (weak) IBOutlet UIButton *callToActionButton;
@property (weak) IBOutlet UIImageView *iconImageView;
@property (weak) IBOutlet UIImageView *mainImageView;
@property (weak) IBOutlet UIImageView *privacyInformationIconImageView;

- (instancetype)init;

@end
