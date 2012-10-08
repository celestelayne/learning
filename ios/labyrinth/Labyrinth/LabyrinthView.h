//
//  LabyrinthView.h
//  Labyrinth
//
//  Created by hugo on 9/3/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreMotion/CoreMotion.h>
#import "math.h"
#import "LabyrinthViewController.h"

@class LabyrinthViewController;


@interface LabyrinthView : UIView

@property (strong) CALayer *wall;
@property (strong) CALayer *ball;
@property (strong) CALayer *opponentBall;
@property (weak) LabyrinthViewController *VC;

-(void)initializeLabyrinth;
-(void)updateBallPositionWithDeviceMotion:(CMDeviceMotion *)deviceMotion;
@end
