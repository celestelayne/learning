//
//  SpinningViewController.m
//  animationExample
//
//  Created by hugo on 8/22/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "SpinningViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SpinningViewController ()

@property (strong, nonatomic) IBOutlet UIButton *buttonToSpin;
@property (strong, nonatomic) IBOutlet UILabel *labelToSpin;
@end

@implementation SpinningViewController
@synthesize buttonToSpin;
@synthesize labelToSpin;

// CAAnimcation class describes how to animate things
-(CAAnimation *)spinAnimation {
    //
    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    // Each basic animation has a from value and a to value.
    spinAnimation.fromValue = [NSNumber numberWithDouble:0];
    spinAnimation.fromValue = [NSNumber numberWithDouble:(2 * M_PI)];
    spinAnimation.duration = 2.0;
    
    return spinAnimation;
}


-(IBAction)spinTheLavel {
    // I want the animation self SpinAnimation to start for this layer.
    // Key is just for us.
    [self.labelToSpin.layer addAnimation:[self spinAnimation] forKey:@"SpinAnimation"];
    [self.buttonToSpin.layer addAnimation:[self spinAnimation] forKey:@"SpinAnimation"];
}

- (void)viewDidUnload {
    [self setButtonToSpin:nil];
    [super viewDidUnload];
}
@end
