//
//  ReviewViewController.m
//  YelpClone
//
//  Created by Laura on 8/15/12.
//  Copyright (c) 2012 Laura's Empire. All rights reserved.
//

#import "ReviewViewController.h"
#import <Parse/Parse.h>

@interface ReviewViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *stepperLabel;
@property (strong, nonatomic) IBOutlet UIStepper *ratingChanger;
@property (strong, nonatomic) IBOutlet UILabel *averageRating;

@end

@implementation ReviewViewController
@synthesize addressLabel;
@synthesize stepperLabel;
@synthesize ratingChanger;
@synthesize averageRating;

-(void)calculateAverageRatings {
    PFQuery *query = [PFQuery queryWithClassName:@"Ratings"];
    [query whereKey:@"name" equalTo:self.name];
    
    double totalSum = 0;
    NSArray *results = [query findObjects];
    for (PFObject *place in results) {
        NSLog(@"%@", [place objectForKey:@"rating"]);
        totalSum += [[place objectForKey:@"rating"] doubleValue];
    }
    int ratingCount = [results count];
    if (ratingCount) {
        self.averageRating.text = [NSString stringWithFormat:@"Rating: %f", (double) totalSum/ratingCount];
    }
    else {
        self.averageRating.text = @"Be the first to rate this!";
    }
}

- (IBAction)submitButton:(id)sender {
    PFObject *ratingOfSpot = [PFObject objectWithClassName:@"Ratings"];
    [ratingOfSpot setObject:[NSNumber numberWithDouble:ratingChanger.value]  forKey:@"rating"];
    [ratingOfSpot setObject:self.name forKey:@"name"];
    [ratingOfSpot save];
    [self calculateAverageRatings];
    
    
}


- (IBAction)ratingChange:(UIStepper *)sender {
   stepperLabel.text = [NSString stringWithFormat:@"%d",(int) sender.value];
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameLabel.text = self.name;
    self.addressLabel.text = self.address;
    self.ratingChanger.maximumValue = 5;
    self.ratingChanger.minimumValue = 0;
    [self calculateAverageRatings];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setNameLabel:nil];
    [self setAddressLabel:nil];
    [self setStepperLabel:nil];
    [self setRatingChanger:nil];
    [self setAverageRating:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
