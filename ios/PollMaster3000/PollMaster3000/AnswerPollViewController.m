//
//  AnswerPollViewController.m
//  PollMaster3000
//
//  Created by hugo on 8/17/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "AnswerPollViewController.h"
#import "PollStore.h"
#import "DisplayAnswerPollViewController.h"

@interface AnswerPollViewController () <UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *table;
@end

@implementation AnswerPollViewController
@synthesize table;
@synthesize questions;
@synthesize questionObjectIds;

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
    self.table.delegate = self;
    self.table.dataSource = self;
//
    [self queryQuestionsFromParseMethod];
}

-(void)queryQuestionsFromParseMethod {
    NSMutableDictionary *queryResultDictionary = [[NSMutableDictionary alloc] init];
    queryResultDictionary = [PollStore getAllPollsFromParse];
    self.questions = [queryResultDictionary allValues];
    self.questionObjectIds = [queryResultDictionary allKeys];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    [self queryQuestionsFromParseMethod];
}

- (void)viewDidUnload
{
    [self setTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.questions.count;
}

-(id)questionForIndexPath:(NSIndexPath *)indexPath {
    return [self.questions objectAtIndex:indexPath.row];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *question = [self questionForIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"questionCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"questionCell"];
    }
    cell.textLabel.text = question;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *question = [self questionForIndexPath:indexPath];
    // [self.questions objectAtIndex:indexPath.row];
    NSString *questionID = [self.questionObjectIds objectAtIndex:indexPath.row];
    DisplayAnswerPollViewController *displayVC = [DisplayAnswerPollViewController new];
    displayVC.question = question;
    displayVC.questionID = questionID;
    [self.navigationController pushViewController:displayVC animated:YES];
}


@end
