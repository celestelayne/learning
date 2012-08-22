//
//  YelpCloneViewController.m
//  YelpClone
//
//  Created by Laura on 8/14/12.
//  Copyright (c) 2012 Laura's Empire. All rights reserved.
//

#import "YelpCloneViewController.h"
#import "RestKit.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "SimpleAnnotation.h"
#import "ReviewViewController.h"

//Put RKRequestDelegate in .m because we want it to be private.
@interface YelpCloneViewController () <RKRequestDelegate, CLLocationManagerDelegate, MKMapViewDelegate >

{
    CLLocationManager *locationManager;
    
}

-(NSString*)deviceLocation;

@property (strong, nonatomic) IBOutlet UITextField *searchBar;

@property (strong, nonatomic) IBOutlet MKMapView *worldView;


//-(void)findLocation;
//-(void)foundLocation:(CLLocation *)loc;

@end

@implementation YelpCloneViewController

//XCode 4.4 will automatically synthesize these properties and create their _instance variables
@synthesize searchBar;
@synthesize worldView;

- (void)viewDidLoad
{   //Call viewDidLoad on superclass (prob NSObject). Overriding view did load. Want to add to view did load.
    //[super viewDidLoad];
	
    [RKClient clientWithBaseURLString:@"https://maps.googleapis.com/maps/api/place/search/json"];
    
    self.worldView.showsUserLocation = YES;
}



-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 1000, 1000);
    [worldView setRegion:region animated:YES];
    
}

- (void)searchResults: (NSString* )searchText
{
    
    NSString *userLocationLatLng = [self deviceLocation];
    NSLog (@"%@", userLocationLatLng);
    //shared client is a class method, class name is RKClient
    RKClient* client = [RKClient sharedClient];
    NSDictionary* params =[NSDictionary dictionaryWithKeysAndObjects:@"keyword", searchText, @"location", userLocationLatLng, @"rankby", @"distance", @"sensor", @"false",@"key", @"AIzaSyC88DHcZB_QEj8CD9stjdnKBm_g_jAwWow", nil];
    [client get:@"" queryParameters:params delegate:self];
    

}

- (IBAction)searchButton:(UIButton *)sender {
    for (MKViewAnnotation* annototate in [worldView annotations]) {
        // Delete annotations
    }
    
    NSString *getText = searchBar.text;
    [self searchResults: getText];
    [searchBar resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    //When you hit enter, do the search as well
    [self searchResults: searchBar.text];
    return YES;
    
}

- (void)viewDidUnload
{
    [self setWorldView:nil];
    [self setSearchBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



-(void)request:(RKRequest *)request didLoadResponse:(RKResponse *)response
{
    
    //Workin with results
    NSDictionary *googleResults = [request.response parsedBody:nil];
    //  NSLog(@"%@", googleResults);
    //  NSLog(@"%@", [googleResults objectForKey:@"results"]);
    //Google results is a dictionary and inside it is an array. Loop through the array to get the results. For each iteration, we're calling that googleResultsDictionary. Grab lat, lng, digging in. Changed it to a double. Create an instance of annotation and set values (title and lat,lng). Location coordinate 2dmake takes a double, so we had to convert to a double.
    
    for (NSDictionary *googleResultsDictionary in [googleResults objectForKey:@"results" ]) {
//        NSLog(@"%@", googleResultsDictionary);
//        NSLog(@"ANOTHER INSTANCE OF googleResultsDictionary");
        NSString *resultlng = [[[googleResultsDictionary objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lng"];
        NSString *resultlat = [[[googleResultsDictionary objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lat"];
        double lat = [resultlat doubleValue];
        double lng = [resultlng doubleValue];
        
        //Create an annotation that is at the center of the Earth
        SimpleAnnotation* annotation = [SimpleAnnotation new];
        annotation.coordinate = CLLocationCoordinate2DMake (lat,lng);
        annotation.title = [googleResultsDictionary objectForKey:@"name"];
        annotation.vicinity = [googleResultsDictionary objectForKey:@"vicinity"];
        
        //Add annotation to the map
        [self.worldView addAnnotation:annotation];

    }
}

- (NSString *) deviceLocation {
    //Setter methods are better to use than instance variables. Sometimes instance variables do weird things. Won't do lazy iniialization for you.
    self.longitudeOfDevice = [NSString stringWithFormat:@"%f",worldView.userLocation.coordinate.longitude];
    self.latitudeOfDevice = [NSString stringWithFormat:@"%f", worldView.userLocation.coordinate.latitude];
    
    return [self.latitudeOfDevice stringByAppendingFormat:@",%@",self.longitudeOfDevice];
}



-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isMemberOfClass:[SimpleAnnotation class]]) {
    MKAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    annotationView.canShowCallout = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
    } else {
        return nil;
    }
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    [self pushReviewViewController:view];
}
-(void)pushReviewViewController:(MKAnnotationView *)view {
    ReviewViewController* rvc = [ReviewViewController new];
    
    SimpleAnnotation *currentAnnotation = view.annotation;
    
    rvc.name = [currentAnnotation title];
    rvc.address = [currentAnnotation vicinity];
    
    
    [self.navigationController pushViewController:rvc animated:YES];
    
    
}

@end
