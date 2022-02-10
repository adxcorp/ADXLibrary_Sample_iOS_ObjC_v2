//
//  NativeAdView.h
//  ADXExample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ADXLibrary/ADXNativeAdRendering.h>

@interface NativeAdView : UIView <ADXNativeAdRendering>

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *mainTextLabel;
@property (nonatomic, weak) IBOutlet UILabel *callToActionLabel;
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;
@property (nonatomic, weak) IBOutlet UIImageView *mainImageView;
@property (nonatomic, weak) IBOutlet UIImageView *privacyInformationIconImageView;

- (instancetype)init;

@end
