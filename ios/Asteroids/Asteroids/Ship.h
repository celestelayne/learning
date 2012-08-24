//
//  Ship.h
//  Asteroids
//
//  Created by hugo on 8/23/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface Ship : NSObject
@property (strong) CALayer *layer;
@property int health;
-(id)initWithView:(UIView *)view andHealthPoints:(int)healthPoints;
@end
