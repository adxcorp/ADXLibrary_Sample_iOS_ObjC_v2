//
//  NativeAdView.m
//  ADXExample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import "NativeAdView.h"

@implementation NativeAdView

- (instancetype)init {
    NativeAdView *result = nil;
    
    NSBundle* bundle = [NSBundle mainBundle];
    NSArray *elements = [bundle loadNibNamed:@"NativeAdView" owner:self options:nil];
    
    for (id anObject in elements) {
        if ([anObject isKindOfClass:NSClassFromString(@"NativeAdView")]) {
            result = anObject;
            break;
        }
    }
    
    return result;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (UILabel *)nativeMainTextLabel {
    return self.mainTextLabel;
}

- (UILabel *)nativeTitleTextLabel {
    return self.titleLabel;
}

- (UILabel *)nativeCallToActionTextLabel {
    return self.callToActionLabel;
}

- (UIImageView *)nativeIconImageView {
    return self.iconImageView;
}

- (UIImageView *)nativeMainImageView {
    return self.mainImageView;
}

- (UIImageView *)nativePrivacyInformationIconImageView {
    return self.privacyInformationIconImageView;
}

@end
