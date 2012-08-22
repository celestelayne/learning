//
//  Person.m
//  TimeAfterTime
//
//  Created by hugo on 8/8/12.
//  Copyright (c) 2012 Squanto. All rights reserved.
//


#import "Person.h"

@implementation Person


// Implementing this setter method.
- (void)setHeightInMeters:(float)h
{
    heightInMeters = h;
}

//Implements another setter method.
- (void)setWeightInKilos:(int)w
{
    weightInKilos = w;
}


//Here, getter methods are implemented.
- (float)heightInMeters {
    return heightInMeters;
}
- (int)weightInKilos {
    return weightInKilos;
}


// Defines the contents of the bodyMassIndex instance method.
- (float)bodyMassIndex
{
    return weightInKilos / (heightInMeters * heightInMeters);
}


@end
