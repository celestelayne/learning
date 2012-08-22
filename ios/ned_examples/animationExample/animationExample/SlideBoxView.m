//
//  SlideBoxView.m
//  animationExample
//
//  Created by hugo on 8/22/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "SlideBoxView.h"
#import <QuartzCore/QuartzCore.h>

@interface SlideBoxView ()

@property (strong) CALayer* boxLayer;

@end

@implementation SlideBoxView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.boxLayer = [[CALayer alloc] init];
        
        
        // QuartzCore is more low level that CoreGraphics
        // You need to give it the CGColor property of a UIColor
        self.boxLayer.backgroundColor = [[UIColor redColor] CGColor];
        
        // Make a rectangle that starts here.
        self.boxLayer.bounds = CGRectMake(0, 0, 80, 80);
        
        
        [self.layer addSublayer: self.boxLayer];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // There's only one touch in our touches
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    
    // This is implicitly animatable
    self.boxLayer.position = touchPoint;
}


// This lags a bit behind. The animation is too slow here because of the implicit animation.
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // There's only one touch in our touches
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    
    //Everything that I give you in this transaction should happen together.
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.boxLayer.position = touchPoint;
    [CATransaction commit];
}


@end
