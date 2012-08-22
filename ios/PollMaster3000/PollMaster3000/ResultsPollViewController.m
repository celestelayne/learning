//
//  ResultsPollViewController.m
//  PollMaster3000
//
//  Created by hugo on 8/17/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "ResultsPollViewController.h"
#import "AnswerPollViewController.h"
#import "PollStore.h"

@interface ResultsPollViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *resultsTable;

@end

@implementation ResultsPollViewController
@synthesize resultsTable;


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
    self.resultsTable.dataSource = self;
    self.resultsTable.delegate = self;
    
    // sets up view (all of it)..
    // Get The List of Questions
    // For each question, get the corresponding answers array.
    NSDictionary *parseDictionary = [PollStore getAllPollsFromParse];
    NSArray *questionIDs = [parseDictionary allKeys];
    NSArray *questions = [parseDictionary allValues];
    
//    for (NSString *questionID in questionIDs) {
//        NSArray *allAnswersForAQuestion = [PollStore getAllAnswersFromParse:questionID];
//        
//        
//        
//        NSLog(@"%d", allAnswersForAQuestion.count);
//    }
//    
    
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
