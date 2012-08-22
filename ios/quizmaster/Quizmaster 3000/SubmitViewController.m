//
//  SubmitViewController.m
//  Quizmaster 3000
//
//  Created by Michael Ng on 8/14/12.
//  Copyright (c) 2012 Amherst College. All rights reserved.
//

#import "SubmitViewController.h"
#import <Parse/Parse.h>

@interface SubmitViewController ()

@end

@implementation SubmitViewController
@synthesize questionTextField;
@synthesize answerTextField;
@synthesize delegate;

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
    
    questionTextField.delegate = self;
    answerTextField.delegate = self;
}

- (void)viewDidUnload
{
    [self setQuestionTextField:nil];
    [self setAnswerTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)submit:(id)sender 
{
    
    NSString* question = [questionTextField text];
    NSString* answer = [answerTextField text];
    
    PFObject *submission = [PFObject objectWithClassName:@"Submissions"];
    [submission setObject:question forKey:@"Question"];
    [submission setObject:answer forKey:@"Answer"];
    
    NSString *alertMessage;
    
    if ([submission save]){
        alertMessage = @"Your submission has been saved!";
    }
    else {
        alertMessage = @"An error has occured. Submission not saved.";
    }
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:alertMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
    questionTextField.text = nil;
    answerTextField.text = nil;
    [self dismissKeyboard];
    
    [self.delegate newSubmission];
}

- (IBAction)dismissKeyboard {

    [self textFieldShouldReturn:questionTextField];
    [self textFieldShouldReturn:answerTextField];
}

- (BOOL) textFieldShouldReturn:(UITextField *)txtField
{
    [txtField resignFirstResponder];
    return YES;
}

@end
