//
//  main.m
//  TimeAfterTime
//
//  Created by hugo on 8/7/12.
//  Copyright (c) 2012 Squanto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


/****************
 Used Functions
*****************/

// ? Challenge for 15.
void findProperNamesThatAreRegularWordsChallengeFunction() {
    //Read the list of names and store them into an array.
    NSString *nameString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames" encoding:NSUTF8StringEncoding error:NULL];
    NSArray *names = [nameString componentsSeparatedByString:@"\n"];
    
    //Read the list of words and store them into an array.
    NSString *wordString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words" encoding:NSUTF8StringEncoding error:NULL];
    NSArray *words = [wordString componentsSeparatedByString:@"\n"];
    
    // NSSet will be more efficient here..
    // Loop through the array of proper names
    for (NSString *n in names) {
        for(NSString *w in words) {
            if ([w caseInsensitiveCompare:n] == NSOrderedSame) {
                NSLog(@"The name %@", w);
            }
        }
    }
    
}

void nameStringReaderExample() {
    // Read in a file as a huge string (ignoring the possibility of an error)
    NSString *nameString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames" encoding:NSUTF8StringEncoding error:NULL];
    
    // Break it into an array of strings by newline
    NSArray *names = [nameString componentsSeparatedByString:@"\n"];
    
    
    // Go through the array one string at a time.
    for (NSString *n in names) {
        // Look for the string "aa" in a case-insensitive manner
        NSRange r = [n rangeOfString:@"AA" options:NSCaseInsensitiveSearch];
        
        // Was it found?
        if (r.location != NSNotFound) {
            NSLog(@"%@", n);
        }
    }
    
}


void groceriesChallengeFunction() {
    //Created an Empty array
    NSMutableArray *groceriesList = [NSMutableArray array];
    
    // Created some NSString objects pointing to strings.
    NSString *milk = @"Milk";
    NSString *eggs = @"Eggs";
    NSString *deer = @"Deer";
    
    //Add the groceries to the list
    [groceriesList addObject:milk];
    [groceriesList addObject:eggs];
    [groceriesList addObject:deer];
    
    for(NSString *s in groceriesList) {
        NSLog(@"Gotta get me some %@", s);
    }
    
    // For giggles
    NSLog(@"Mmm, especially %@..", [groceriesList lastObject]);
    
}

void arrayFunction() {
    // Create three NSDate objects
    NSDate *now = [NSDate date];
    NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
    NSDate *yesterday = [now dateByAddingTimeInterval: 24.0 * 60.0 * 60.0];
    
    
    
    //Create an empty mutable array
    NSMutableArray *dateList = [NSMutableArray array];
    
    // Add the dates to the array
    [dateList addObject:now];
    [dateList addObject:tomorrow];
    
    //Put yesterday at the beginning of the list
    [dateList insertObject:yesterday atIndex:0];
    
    for (NSDate *d in dateList) {
        NSLog(@"Here is a date %@", d);
    }
    
    // Remove yesterday
    [dateList removeObjectAtIndex:0];
    NSLog(@"Now the first date is %@", [dateList objectAtIndex:0]);
    
    
    /*
     // How many dates are there?
     //NSLog(@"There are %lu dates", [dateList count]);
     
     //Print a couple
     NSLog(@"The third date is %@", [dateList objectAtIndex:2]);
     
     Create an array containing all three (nil terminates the list)
     NSArray *dateList = [NSArray arrayWithObjects:now, tomorrow, yesterday, nil];
     
     //A bit roundabout, but a for loop iterating over an NSArray nonetheless
     //Known as a fast enumeration, it is extremely efficient.
     //You can't edit it (+ or -) while iterating over it.
     NSUInteger dateCount = [dateList count];
     for (int i = 0; i < dateCount; i++) {
     NSDate *d = [dateList objectAtIndex:i];
     NSLog(@"Here is a date: %@", d);
     }
     */
}


void dateFunction() {
    NSDate *now = [NSDate date]; // is the same as [[NSDate alloc] initwith date]
    NSLog(@"The date is %@", now);
    
    double seconds = [now timeIntervalSince1970];
    NSLog(@"It has been %f seconds since the start of 1970.", seconds);
    
    NSDate *later = [now dateByAddingTimeInterval:100000];
    NSLog(@"In 100,000 seconds it will be %@", later);
    
    // Create a calendar object
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSUInteger day = [cal ordinalityOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:now];
    NSLog(@"This is day %lu of the month", day);
}

void timeZoneFunction() {
    NSTimeZone *here = [NSTimeZone systemTimeZone];
    
    if (here.isDaylightSavingTime == YES) {
        NSLog(@"Yup, it's daylight savings!");
    } else {
        NSLog(@"Nope, it's not daylight savings.");
    }
}

void hostFunction() {
    NSHost *myHostInfo = [NSHost currentHost];
    NSString *baller = [myHostInfo localizedName];
    NSLog(@"%@",baller);
}


/****************
 Current Function
 *****************/

void functionThatCreatesAPersonObject() {
    //Create an instance of Person
    Person *person = [[Person alloc] init];
    
    //Give the instance variables values
    [person setWeightInKilos:96];
    [person setHeightInMeters:1.8];
    
    //Call the bodyMassIndex method
    float bmi = [person bodyMassIndex];
    NSLog(@"person(%d, %f) has a BMI of %f",[person weightInKilos], [person heightInMeters], bmi);
    
}






int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        functionThatCreatesAPersonObject();
        
    }
    return 0;
}

