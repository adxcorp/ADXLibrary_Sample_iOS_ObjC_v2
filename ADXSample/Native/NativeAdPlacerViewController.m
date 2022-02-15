//
//  NativeAdPlacerViewController.m
//  ADXSample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import "NativeAdPlacerViewController.h"
#import "NativeAdView.h"

#import <ADXLibrary/ADXNativeAdFactory.h>

@interface NativeAdPlacerViewController () <UICollectionViewDataSource, UICollectionViewDelegate, ADXCollectionViewAdPlacerDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *mainCollectionView;
@property (nonatomic, strong) ADXCollectionViewAdPlacer *placer;

@end

@implementation NativeAdPlacerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[ADXNativeAdFactory sharedInstance] setRenderingViewClass:ADX_NATIVE_AD_UNIT_ID renderingViewClass:[NativeAdView class]];
    
    ADXAdPositioning *adPositioning = [ADXAdPositioning positioning];
    [adPositioning addFixedIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [adPositioning enableRepeatingPositionsWithInterval:3];
    
    self.placer = [[ADXNativeAdFactory sharedInstance] getCollectionViewAdPlacer:ADX_NATIVE_AD_UNIT_ID
                                                                  collectionView:self.mainCollectionView
                                                                  viewController:self
                                                                   adPositioning:adPositioning];
    [self.placer loadAdsForAdUnitID:ADX_NATIVE_AD_UNIT_ID];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 60;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView adx_dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath.row : %ld", (long)indexPath.row);
    
    return NO;
}

@end
