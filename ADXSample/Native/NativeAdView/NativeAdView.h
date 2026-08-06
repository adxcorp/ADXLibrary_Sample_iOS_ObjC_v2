//
//  NativeAdView.h
//  ADXSample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ADXLibrary/ADXNativeAdRendering.h>

NS_ASSUME_NONNULL_BEGIN

@interface NativeAdView : UIView <ADXNativeAdRendering>

@property (weak) UILabel *titleLabel;
@property (weak) UILabel *mainTextLabel;
@property (weak) UIButton *callToActionButton;
@property (weak) UIImageView *iconImageView;
@property (weak) UIImageView *mainImageView;
@property (weak) UIImageView *privacyInformationIconImageView;

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
