//
//  Asteroid.h
//  Asteroids
//
//  Created by hugo on 8/23/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Asteroid : NSObject
//@property CGPoint position;
@property CALayer *layer;
+(Asteroid *)createWithPosition:(CGPoint)position inView:(UIView *)view;
-(void)move;
-(void)pause;
@end
