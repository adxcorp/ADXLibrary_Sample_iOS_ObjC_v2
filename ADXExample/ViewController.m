//
//  ViewController.m
//  ADXExample
//
//  Copyright © 2017 AD(X) Corp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *navigationBarAppearance = [[UINavigationBarAppearance alloc] init];
        [navigationBarAppearance configureWithOpaqueBackground];
        navigationBarAppearance.backgroundColor = [UIColor whiteColor];
        [navigationBarAppearance setTitleTextAttributes: @{ NSForegroundColorAttributeName: [UIColor blackColor] }];
        
        self.navigationController.navigationBar.standardAppearance = navigationBarAppearance;
        self.navigationController.navigationBar.scrollEdgeAppearance = navigationBarAppearance;
        self.navigationController.navigationBar.translucent = NO;
    }
}

@end
