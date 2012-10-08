//
//  LabyrinthView.m
//  Labyrinth
//
//  Created by hugo on 9/3/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//
#import "LabyrinthView.h"

@interface LabyrinthView ()

@end

@implementation LabyrinthView

// when the view gets created programmatically
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeLabyrinth];
    }
    return self;
}

- (void)initializeLabyrinth
{
    
    // initialize CALayer ball
    self.ball = [CALayer layer];
    self.ball.bounds = CGRectMake(0, 0, 30, 30);
    self.ball.contents = (__bridge id)([[UIImage imageNamed:[NSString stringWithFormat:@"ball.jpeg"]] CGImage]);
    // self.ball.position = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
    self.ball.position = CGPointMake(150, 150);
    self.ball.backgroundColor = [[UIColor blackColor] CGColor];
    [self.layer addSublayer:self.ball];
    
    // initialize the Berlin wall
    self.wall = [CALayer layer];
    self.wall.bounds = CGRectMake(0.0, 0.0, 180.0, 10.0);
    self.wall.position = CGPointMake(180.0, 180.0);
    self.wall.backgroundColor = [[UIColor blackColor] CGColor];
    [self.layer addSublayer:self.wall];
}

-(void)updateOrientationWithDeviceMotion:(CMDeviceMotion *)deviceMotion
{
    // For ball
    [self updateBallPositionWithDeviceMotion:deviceMotion];
}

-(void)updateBallPositionWithDeviceMotion:(CMDeviceMotion *)deviceMotion
{
    int VELOCIMATOR = 20;
    // If the roll and pitch are not big enough, just return
    if (!(fabs(deviceMotion.attitude.roll) > 0.015) && !(fabs(deviceMotion.attitude.pitch) > 0.015)) {
        return;
    }
   
    double deltaX = deviceMotion.attitude.roll * VELOCIMATOR;
    double deltaY = deviceMotion.attitude.pitch * VELOCIMATOR;
            
    //  Move to the new position in small increments, checking for collision each time
    for (int i = 0; i < 100; i += 1) {
        CGPoint newPosition;
        newPosition.x = self.ball.position.x + (deltaX / 100);
        newPosition.y = self.ball.position.y + (deltaY / 100);
        
        if (![self checkCollisionBetween:self.wall.frame andRect2:CGRectMake(newPosition.x - self.ball.frame.size.width/2.0, newPosition.y - self.ball.frame.size.height/2.0, self.ball.frame.size.width, self.ball.frame.size.height)]) {
            self.ball.position = newPosition;
        } else {
            // We hit a wall, slide along it then break out of the loop
            double xOffSet = self.ball.frame.size.width/2.0;
            double yOffSet = self.ball.frame.size.height/2.0;
            
            // try to move ball to (x + deltaX, y)
            if (![self checkCollisionBetween:self.wall.frame andRect2:CGRectMake(self.ball.position.x + deltaX - xOffSet, self.ball.position.y - yOffSet, self.ball.frame.size.width, self.ball.frame.size.height)]) {
                self.ball.position = CGPointMake(self.ball.position.x + deltaX, self.ball.position.y);
            }
            // (x, y + deltaY)
            else if ([self checkCollisionBetween:self.wall.frame andRect2:CGRectMake(self.ball.position.x - xOffSet, self.ball.position.y + deltaY - yOffSet, self.ball.frame.size.width, self.ball.frame.size.height)]) {
                self.ball.position = CGPointMake(self.ball.position.x, self.ball.position.y + deltaY);
            }
            // (x + deltaX, y + deltaY)
            else if ([self checkCollisionBetween:self.wall.frame andRect2:CGRectMake(self.ball.position.x + deltaX - xOffSet, self.ball.position.y + deltaY - yOffSet, self.ball.frame.size.width, self.ball.frame.size.height)]) {
                self.ball.position = CGPointMake(self.ball.position.x + deltaX, self.ball.position.y + deltaY);
            }
           break;
        }
    }
    // Ensure ball is within the boundaries of the view
    [self keepBallWithinWindow:self.ball.position];
    [self setNeedsDisplay];
    
    [(LabyrinthViewController *)self.VC sendAllData];
}

- (BOOL)checkCollisionBetween:(CGRect)rect1 andRect2:(CGRect)rect2
{
    return CGRectIntersectsRect(rect1, rect2);
}

-(void)keepBallWithinWindow:(CGPoint)ballPosition
{
    CGPoint position = ballPosition;
    if (position.x > self.bounds.size.width - (self.ball.bounds.size.width / 2.0)) {
        position = CGPointMake(self.bounds.size.width - (self.ball.bounds.size.width / 2.0), position.y);
    } else if (position.x < 0) {
        position = CGPointMake(0, position.y);
    }
    
    if ((position.y > self.bounds.size.height - (self.ball.bounds.size.height / 2.0))) {
        position = CGPointMake(position.x, self.bounds.size.height - (self.ball.bounds.size.height / 2.0));
    } else if (position.y < 0) {
        position = CGPointMake(position.x, 0);
    }
    self.ball.position = position;
}

@end
