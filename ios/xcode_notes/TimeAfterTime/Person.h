//
//  Person.h
//  TimeAfterTime
//
//  Created by hugo on 8/8/12.
//  Copyright (c) 2012 Squanto. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
The header file of my Person class
 This is all of the information that my Person class will have. These things are declarations.
 It'll all be implemented in the .m file.
The class Person inherits all the instance variables and methods defined by
the class NSObject
*/
@interface Person : NSObject
// Declare instance variables inside the curly braces.
{
    //It has two instance variables
    float heightInMeters;
    int weightInKilos;
}

    // Declared methods outside the curly braces.
    //You will now able to set those instance variables using these methods.
- (void)setHeightInMeters: (float)h;
- (void)setWeightInKilos: (int)w;

    //These are getter methods. Notice they don't have get in their names.
- (float)heightInMeters;
- (int)weightInKilos;

// This method calculates the Body Mass Index
- (float)bodyMassIndex;

@end
