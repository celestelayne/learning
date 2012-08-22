//
//  SmileView.m
//  Smile
//
//  Created by Jonathan Tamboer on 8/21/12.
//  Copyright (c) 2012 Jonathan Tamboer. All rights reserved.
//

#import "SmileView.h"

@implementation SmileView

/*
// 
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
 */


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


// Ned's code...
-(CGFloat)randomIntensity {
    return (double) arc4random() / INT_MAX;
}

-(UIColor*)randomColor {
    return [UIColor colorWithRed:[self randomIntensity] green:[self randomIntensity] blue:[self randomIntensity] alpha:1];
}

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    double x0 = self.bounds.origin.x;
    double y0 = self.bounds.origin.y;
    
    double winWidth = self.bounds.size.width;
    double winHeight = self.bounds.size.height;
    
    double xMax = x0 + winWidth;
    double yMax = y0 + winHeight;
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, x0, y0);
    CGContextAddLineToPoint(context, xMax, y0);
    CGContextAddLineToPoint(context, xMax, yMax);
    CGContextAddLineToPoint(context, x0, yMax);
    
    [[self randomColor] set];
    CGContextFillPath(context);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}


@end
