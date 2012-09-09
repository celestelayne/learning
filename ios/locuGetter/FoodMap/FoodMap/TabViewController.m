//
//  TabViewController.m
//  FoodMap
//
//  Created by hugo on 9/8/12.
//  Copyright (c) 2012 Hugo Melo. All rights reserved.
//

#import "TabViewController.h"
#import "AwesomeViewController.h"
#import "SettingsViewController.h"
#import "SearchViewController.h"

@interface TabViewController ()

@property (strong) PFLogInViewController *loginVC;

@end

@implementation TabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        SearchViewController *searchVC = [SearchViewController new];
        AwesomeViewController *awesomeVC = [AwesomeViewController new];
        SettingsViewController *settingsVC = [SettingsViewController new];
        
        UIImage *globeImage = [UIImage imageNamed:@"globe.png"];
        UIImage *starImage = [UIImage imageNamed:@"star.png"];
        UIImage *cogImage = [UIImage imageNamed:@"cog_02.png"];
        
        UITabBarItem *searchItem = [[UITabBarItem alloc] initWithTitle:@"Search" image:globeImage tag:0];
        UITabBarItem *randomAwesomeItem = [[UITabBarItem alloc] initWithTitle:@"Random Awesome" image:starImage tag:1];
        UITabBarItem *settingsItem = [[UITabBarItem alloc] initWithTitle:@"Settings" image:cogImage tag:2];
        
        searchVC.tabBarItem = searchItem;
        awesomeVC.tabBarItem = randomAwesomeItem;
        settingsVC.tabBarItem = settingsItem;
        
        self.viewControllers =[NSArray arrayWithObjects:searchVC, awesomeVC, settingsVC, nil];
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    if (![PFUser currentUser]) {
        self.loginVC = [PFLogInViewController new];
        self.loginVC.delegate = self;
        self.loginVC.fields = PFLogInFieldsDefault;
        
        // Logo
        self.loginVC.logInView.logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
        self.loginVC.logInView.logo.frame = CGRectMake(66.5, 70, 187, 58.5);
        self.loginVC.signUpController.signUpView.logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
        self.loginVC.signUpController.signUpView.logo.frame = CGRectMake(66.5, 70, 187, 58.5);
        
        [self presentModalViewController:self.loginVC animated:YES];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/***********************
 
 PARSE DELEGATE METHODS
 
 **********************/


// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length != 0 && password.length != 0) {
        return YES; // Begin login process
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Make sure you fill out all of the information!"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}


// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.navigationController popViewControllerAnimated:YES];
}

// Sent to the delegate to determine whether the sign up request should be submitted to the server.
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    BOOL informationComplete = YES;
    
    // loop through all of the submitted data
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || field.length == 0) { // check completion
            informationComplete = NO;
            break;
        }
    }
    
    // Display an alert if a field wasn't completed
    if (!informationComplete) {
        [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                    message:@"Make sure you fill out all of the information!"
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
    }
    
    return informationComplete;
}

// Sent to the delegate when a PFUser is signed up.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissModalViewControllerAnimated:YES]; // Dismiss the PFSignUpViewController
}

// Sent to the delegate when the sign up attempt fails.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up...");
}

// Sent to the delegate when the sign up screen is dismissed.
- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    NSLog(@"User dismissed the signUpViewController");
}

@end
