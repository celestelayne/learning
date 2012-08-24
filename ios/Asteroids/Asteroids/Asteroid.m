//
//  Asteroid.m
//  Asteroids
//
//  Created by hugo on 8/23/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "Asteroid.h"
#import <QuartzCore/QuartzCore.h>

@implementation Asteroid
//@synthesize position;
@synthesize layer;

+(Asteroid *)createWithPosition:(CGPoint)position inView:(UIView *)view {
    Asteroid *ast = [Asteroid new];
    ast.layer = [CALayer new];
//    ast.position = position;
    ast.layer.position = position;
    // The size of each asteroid.. Makes a 30x30 bounds
    ast.layer.bounds = CGRectMake(0, 0, 40, 40);
    ast.layer.delegate = ast;
    
    // Adds the visual layer I've just created to the view's layer. Does the drawing part.
    [view.layer addSublayer:ast.layer];
    
    [ast.layer setNeedsDisplay];
    
    return ast;
}

-(CGFloat)randomIntensity {
    // Returns random number between 0-1;
    return (double) arc4random() / INT_MAX;
}

-(UIColor *)randomColor {
    return [UIColor colorWithRed:[self randomIntensity] green:[self randomIntensity] blue:[self randomIntensity] alpha:[self randomIntensity]];
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    // Hardcore drawing action
    CGContextSetFillColorWithColor(ctx, [[self randomColor] CGColor]);
    
    // Draws an elipse. 
    CGContextFillEllipseInRect(ctx, self.layer.bounds);
}

-(CGPoint)randomPosition {
    double xPos = ((double)arc4random() / UINT_MAX) * (self.layer.superlayer.bounds.size.width);
    double yPos = ((double)arc4random() / UINT_MAX) * (self.layer.superlayer.bounds.size.height);
    
    return CGPointMake(xPos, yPos);
}


-(void)move {
    CGPoint updatedLocation = [self randomPosition];
    [CATransaction begin];
    [CATransaction setAnimationDuration:(arc4random() % 25)];
    [CATransaction setCompletionBlock:^{[self move];}];
    self.layer.position = updatedLocation;
    [CATransaction commit];
}



@end
