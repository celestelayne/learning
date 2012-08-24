//
//  GameView.m
//  Asteroids
//
//  Created by hugo on 8/23/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//
#import "GameView.h"
#import "Asteroid.h"
    #import "Ship.h"
#import <QuartzCore/QuartzCore.h>

// Creates a private instance method.
@interface GameView(){
    Ship *ship;
    NSTimer *collisionTimer;
}
@end

@implementation GameView
@synthesize asteroids;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        // Don't forget this..
        asteroids = [NSMutableArray new];
        
        for (int i= 0; i < 10; i++) {
            Asteroid  *ast = [Asteroid createWithPosition:[self makeRandomLocation] inView:self];
            [asteroids addObject:ast];
            [ast move];
        }
        ship = [[Ship alloc] initWithView:self andHealthPoints:100];
        collisionTimer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(shipCollision) userInfo:nil repeats:YES];
    
    }
    return self;
}

-(void)shipCollision {
    Asteroid *temporaryAsteroidWithALongName;
    
    for (Asteroid *ast in asteroids) {
        if (CGRectIntersectsRect(ship.layer.frame, [[ast.layer presentationLayer] frame])) {
            temporaryAsteroidWithALongName = ast;
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Lost!" message:@"Ya just got smashed!" delegate:self cancelButtonTitle:@"Ok capn'" otherButtonTitles: nil];
            [alert show];
            break;
        }
    }
    if (temporaryAsteroidWithALongName) {
        [self removeAndRespawnAsteroid:temporaryAsteroidWithALongName];
    }
}


-(CGPoint)makeRandomLocation {
    double xPos = ((double)arc4random() / UINT_MAX) * (self.bounds.size.width);
    double yPos = ((double)arc4random() / UINT_MAX) * (self.bounds.size.height);
    return CGPointMake(xPos, yPos);
}


-(void)removeAndRespawnAsteroid:(Asteroid *)ast {
    [asteroids removeObject:ast];
    // Removes the asteroid from the view's layer.
    [ast.layer removeFromSuperlayer];
    
    Asteroid *respawnedAsteroid = [Asteroid createWithPosition:[self makeRandomLocation] inView:self];
    [asteroids addObject:respawnedAsteroid];
    [respawnedAsteroid move];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint touchPosition = [[touches anyObject] locationInView:self];
    Asteroid *tempAsteroid;
    for (Asteroid *ast in asteroids) {
        CALayer *tempAsteroidLayer = [ast.layer presentationLayer];
        if (CGRectContainsPoint(tempAsteroidLayer.frame, touchPosition)) {
            tempAsteroid = ast;
        }
    }
    if(tempAsteroid){
        [self removeAndRespawnAsteroid:tempAsteroid];
    }
}


@end
