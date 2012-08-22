//
//  DisplayAnswerPollViewController.m
//  PollMaster3000
//
//  Created by hugo on 8/20/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "DisplayAnswerPollViewController.h"
#import "PollStore.h"

@interface DisplayAnswerPollViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *pollQuestionLabel;
@property (strong, nonatomic) IBOutlet UITableView *answerOptionTable;
@property (strong) NSArray *answerOptions;
@end

@implementation DisplayAnswerPollViewController
@synthesize pollQuestionLabel;
@synthesize answerOptionTable;
@synthesize answerOptions;
@synthesize currentCell;

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
    // Do any additional setup after loading the view from its nib.
    self.answerOptionTable.delegate = self;
    self.answerOptionTable.dataSource = self;
    self.answerOptions = [[NSArray alloc] initWithObjects:
                          @"Strongly Agree",
                          @"Agree",
                          @"Neutral",
                          @"Disagree",
                          @"Strongly Disagree",
                          nil];
    self.pollQuestionLabel.text = self.question;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.answerOptions.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"answerOptionsCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"answerOptionsCell"];
    }
    if (cell == self.currentCell) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone; //Also 0
    }
    
    
    cell.textLabel.text = [self.answerOptions objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.currentCell = cell;
    
    [PollStore addPollAnswerToParse:cell.textLabel.text forASpecificPollID:self.questionID];
    
    [tableView reloadData];
    
    
    
    /*
     -(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     NSString *question = [self questionForIndexPath:indexPath];
     // [self.questions objectAtIndex:indexPath.row];
     NSString *questionID = [self.questionObjectIds objectAtIndex:indexPath.row];
     DisplayAnswerPollViewController *displayVC = [DisplayAnswerPollViewController new];
     displayVC.question = question;
     displayVC.questionID = questionID;
     [self.navigationController pushViewController:displayVC animated:YES];
     }
     */
    
}

- (void)viewDidUnload
{
    [self setAnswerOptionTable:nil];
    [self setPollQuestionLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
