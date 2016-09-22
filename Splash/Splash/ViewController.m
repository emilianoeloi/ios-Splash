//
//  ViewController.m
//  Splash
//
//  Created by Emiliano on 9/22/16.
//  Copyright © 2016 Emiliano. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *splashHeader;
@property (weak, nonatomic) IBOutlet UIView *logo;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoYCenter;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *splashHeaderHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *splashHeaderBottom;


@property (nonatomic, assign) CGFloat screenHeight;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self transformSplashToHeader];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma MARK Wait to transformating
-(void) transformSplashToHeader {
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 1);
    dispatch_after(delay, dispatch_get_main_queue(), ^(void) {
        [self animateSplashHeader];
    });
}

-(void) animateSplashHeader {
    
    /// HEADER SPLASH
    [self.view setNeedsLayout];
    [_splashHeader setNeedsLayout];
    [UIView animateWithDuration:0.8 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [_splashHeaderHeight setActive:YES];
        [_splashHeaderBottom setActive:NO];
        [_logoHeight setConstant:30];
        [_logoYCenter setConstant:10];
        
        [self.view layoutIfNeeded];
        [_splashHeader layoutIfNeeded];
    } completion:^(BOOL finished) {
        NSLog(@"End");
    }];
    
}


@end
