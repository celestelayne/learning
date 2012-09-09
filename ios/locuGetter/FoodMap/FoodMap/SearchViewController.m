//
//  SearchViewController.m
//  FoodMap
//
//  Created by hugo on 9/8/12.
//  Copyright (c) 2012 Hugo Melo. All rights reserved.
//

#import "SearchViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <RestKit/RestKit.h>

@interface SearchViewController ()<UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate, RKRequestDelegate>

@property (strong) CLLocationManager *locationManager;
@property (strong) NSArray *generalSearchComponents;
@property (strong) RKClient *venueFinderClient;
@property (strong) RKClient *menueFinderClient;

@end

@implementation SearchViewController
@synthesize resultsTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.resultsTable.delegate = self;
        self.resultsTable.dataSource = self;
        
        self.locationManager = [CLLocationManager new];
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        self.locationManager.distanceFilter = kCLDistanceFilterNone; // meters.
        self.locationManager.delegate = self;
        [self.locationManager startUpdatingLocation];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self queryLocuWithLocation:self.locationManager.location.coordinate];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    // hmm...
}

- (void)viewDidUnload
{
    [self setResultsTable:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)queryLocuWithLocation:(CLLocationCoordinate2D)pos
{
    self.venueFinderClient = [RKClient clientWithBaseURLString:@"http://api.locu.com/v1_0"];
    
    NSString *location = [NSString stringWithFormat:@"%f,%f", pos.latitude, pos.longitude];
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setObject:@"4213e429341d079d8724989e6aa4487b1d8508df" forKey:@"api_key"];
    [params setObject:location forKey:@"location"];
    [params setObject:@"restaurant" forKey:@"category"];
    [params setObject:@"true" forKey:@"has_menu"];
    [params setObject:@"1000" forKey:@"radius"];
    
    RKRequest *request = [self.venueFinderClient get:@"/venue/search/?" queryParameters:params delegate:self];
    [request setUserData:@"findVenues"];
}


-(void)request:(RKRequest *)request didLoadResponse:(RKResponse *)response {
//    NSLog(@"%@", [[[[request.response parsedBody:nil] objectForKey:@"objects"] objectAtIndex:1] objectForKey:@"id"]);

    // Mega-awesome request checker
    if ([request.userData isEqual:@"findVenues"]) {
        for (int i = 1; i < [[[request.response parsedBody:nil] objectForKey:@"objects"] count]; i++) {
            NSLog(@"%@", [[[[request.response parsedBody:nil] objectForKey:@"objects"] objectAtIndex:i] objectForKey:@"id"]);
            [self queryMenuFromVenue:[[[[request.response parsedBody:nil] objectForKey:@"objects"] objectAtIndex:i] objectForKey:@"id"]];
            
        }
    
    }
    
    
    if ([request.userData isEqual:@"venueMenu"]) {
        // NSLog(@"MENUS!!! %@", [[[[response parsedBody:nil] objectForKey:@"objects"] objectAtIndex:0] objectForKey:@"menus"]);
        // Make menu item pfobject.
        
        
        NSLog(@"Their stuff: %@", [[[[[[[[response parsedBody:nil] objectForKey:@"objects"] objectAtIndex:0] objectForKey:@"menus"] objectAtIndex:0] objectForKey:@"sections"] objectAtIndex:1] objectForKey:@"subsections"]);
        NSLog(@"FINISHED!!");
//        NSArray *sections = [[[[[response parsedBody:nil] objectForKey:@"objects"] objectAtIndex:0] objectForKey:@"menus"] objectForKey:@"sections"];
//        
//        for (int i = 0; i < [sections count]; i++) {
//            NSArray *contents = [[[[sections objectAtIndex:i] objectForKey:@"subsections"] objectAtIndex:0] objectForKey:@"contents"];
//            NSLog(@"CONTENTS: %@", contents);
//        }
    }
}

-(void)queryMenuFromVenue:(NSString *)venueID
{
    self.menueFinderClient = [RKClient clientWithBaseURLString:@"http://api.locu.com/v1_0"];
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setObject:@"4213e429341d079d8724989e6aa4487b1d8508df" forKey:@"api_key"];
    // Add preferences here...
    
    NSString *path = [NSString stringWithFormat:@"/venue/%@/?", venueID];
    RKRequest *request = [self.menueFinderClient get:path queryParameters:params  delegate:self];
    [request setUserData:@"venueMenu"];
}

@end
