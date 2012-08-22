//
//  QAViewController.m
//  Quizmaster 3000
//
//  Created by Michael Ng on 8/14/12.
//  Copyright (c) 2012 Amherst College. All rights reserved.
//

#import "QAViewController.h"

@interface QAViewController ()

@end

@implementation QAViewController{
    NSArray *allQA;
    PFObject *currentQAObject;
}
@synthesize answerLabel;
@synthesize questionLabel;

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
	
    [self reloadQAArray];
}

- (void)viewDidUnload
{
    [self setQuestionLabel:nil];
    [self setAnswerLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)showQuestion:(id)sender 
{
    int randNumber = rand() % [allQA count];
    PFObject *qaObject = [allQA objectAtIndex:randNumber];
    currentQAObject = qaObject;
    self.questionLabel.text = [qaObject objectForKey:@"Question"];
    self.answerLabel.text = nil;
}

- (IBAction)showAnswer:(id)sender 
{
    if(currentQAObject){
        self.answerLabel.text = [currentQAObject objectForKey:@"Answer"];
    }
}

- (void)reloadQAArray
{
    PFQuery *query = [PFQuery queryWithClassName:@"Submissions"];
    allQA = [query findObjects];
}

- (void)newSubmission
{
    [self reloadQAArray];
}

@end
