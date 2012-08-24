//
//  Ship.m
//  Asteroids
//
//  Created by hugo on 8/23/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "Ship.h"

@implementation Ship
@synthesize layer;

-(id)initWithView:(UIView *)view andHealthPoints:(int)healthPoints {
    self = [super init];
    if (self) {
        self.health = healthPoints;
        self.layer = [CALayer new];
        self.layer.bounds = CGRectMake(0, 0, 60, 60);
        self.layer.position = CGPointMake(view.layer.bounds.size.width / 2.0, view.layer.bounds.size.height / 2.0);
        self.layer.delegate = self;
        [view.layer addSublayer:self.layer];
        [self.layer setNeedsDisplay];
    }
    return self;
}

// Standard layer
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetFillColorWithColor(ctx, [[UIColor brownColor] CGColor]);
    CGContextFillRect(ctx, self.layer.bounds);
}

@end
