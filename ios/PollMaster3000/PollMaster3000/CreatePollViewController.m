//
//  CreatePollViewController.m
//  PollMaster3000
//
//  Created by hugo on 8/17/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "CreatePollViewController.h"
#import "PollStore.h"


@interface CreatePollViewController ()<UITextFieldDelegate>

- (IBAction)submitButton;
- (IBAction)resignBackgroundAction;

@property (strong, nonatomic) IBOutlet UITextField *questionTextField;
@end

@implementation CreatePollViewController
@synthesize questionTextField;



- (IBAction)submitButton {
    [self actualSubmitActionToParse];
}

-(void)actualSubmitActionToParse
{
    NSString *outgoingQuestion = questionTextField.text;
    
    // Make it go to parse...
    [PollStore addPollQuestionToParse:outgoingQuestion];
    
    // Clear The Text Field
    self.questionTextField.text = @"";
    
    // Makes keyboard go away.
    [questionTextField resignFirstResponder];
    
    // Show A Success UI Alert!!
    UIAlertView* successAlert = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Your stuff was stored" delegate:self cancelButtonTitle:@":)" otherButtonTitles:nil, nil];
    successAlert.show;
    
    [PollStore getAllPollsFromParse];
}


// Resigning The KEYBOARD!!!!
- (IBAction)resignBackgroundAction
{
    // Makes keyboard go away.
    [questionTextField resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self actualSubmitActionToParse];
    return YES;
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
    self.questionTextField.delegate = self;
    
    
}

- (void)viewDidUnload
{
    [self setQuestionTextField:nil];
    // [self setResignBackgroundButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
