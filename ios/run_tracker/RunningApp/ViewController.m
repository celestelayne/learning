//
//  ViewController.m
//  RunningApp
//
//  Created by Robert Carter on 8/16/12.
//  Copyright (c) 2012 Robert Carter. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate> {
    NSDate *startTime;
    NSDate *stopTime;
    CLLocationManager *locationManager;
    CLLocationCoordinate2D currentLocation;
    CLLocationSpeed currentSpeed;
}

@end

@implementation ViewController
@synthesize totalCaloriesBurned;
@synthesize caloriesPerSec;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc] init];
    // Set the controller as the delegate
    [locationManager setDelegate:self];
    [locationManager startUpdatingLocation];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
}

- (IBAction)startPressed
{
    startTime = [NSDate date];
    currentLocation = [[locationManager location] coordinate];
    
    

}
-(void)updateLabels:(CLLocationSpeed)speed grade:(double)grade timeBetweenMeasurements:(NSDate*)deltaTime {
    // VOX = (metersPerSecond * 0.2) + (metersPerSecond * percentGrade * 0.9)
    // METs = VOX / 3.5
    // CALBURNPERHOUR = METs * weight(kgs)
    //Total cals = CALBURNPERHOUR * (timebetweenmeasurements / hour)
    
    //  update the cal/sec label    and   the total cal burned label
}


- (IBAction)stopPressed
{
    NSDate *stopDate = [NSDate date];
}

- (double) calculateGrade:(CLLocationDistance) oldAltitude newAltitude:(CLLocationDistance) newAltitude distance:(CLLocationDistance)distance
{
    if (distance == 0) {
        return 0;
    } else {
        return 100 * (newAltitude - oldAltitude)/distance;
    }
}

- (double) calculateVOXWithCurrentSpeed:(CLLocationSpeed)currentSpeed andAGrade:(double) grade
{
    return 3.5 + (currentSpeed * 0.2) + (currentSpeed * grade * 0.9);
}

-(double) calculateMETSWithVox:(double)vox
{
    return vox / 3.5;
}

-(double)calculateCalsBurnedPerHourWithMETS:(double)mets andWeight:(double)weight
{
    // Should we then increment our running total calories burned variable here?
    return mets * weight;
}

-(double)calculateTotalCaloriesBurnedWithCaloriesBurnedPerHour:(double)calsBurnedPerHour andTimeBetweenMeasurements:(float)time
{
    return 26;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocationDistance distanceTraveled = [oldLocation distanceFromLocation:newLocation];
    
    // Calculate the grade and the time between measurements.
    double grade = [self calculateGrade:[oldLocation altitude] newAltitude:[newLocation altitude] distance:distanceTraveled];
    double vox = [self calculateVOXWithCurrentSpeed:[newLocation speed] andAGrade:grade];
    double METs = [self calculateMETSWithVox:vox];
    double CalsBurnedPerHour = [self calculateCalsBurnedPerHourWithMETS:METs andWeight:182.2];
    double totalCalsBurned = [self calculateTotalCaloriesBurnedWithCaloriesBurnedPerHour:CalsBurnedPerHour andTimeBetweenMeasurements:20.0];
    
    self.caloriesPerSec.text = [NSString stringWithFormat:@"%f", CalsBurnedPerHour];
    self.totalCaloriesBurned.text = [NSString stringWithFormat:@"%f", totalCalsBurned];
    
}

@end
