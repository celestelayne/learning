//
//  FriendTableViewController.m
//  myDiary
//
//  Created by hugo on 8/30/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "FriendTableViewController.h"
#import "DiaryStore.h"
#import "NewEntryViewController.h"

@interface FriendTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong) NSArray *allFriends;
@property (strong) NSMutableSet *selectedFriends;


@end

@implementation FriendTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateList];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed)];
    UIBarButtonItem *tagFriend = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newFriend)];
    self.navigationItem.rightBarButtonItems = @[done, tagFriend];
}



-(void)updateList {
    self.allFriends = [DiaryStore getAllFriends];
}

// Buttons
-(void)doneButtonPressed {
    int backViewCount = [[self.navigationController viewControllers] count] -2;
    NSArray *actualViewControllerIWant = [[self.navigationController viewControllers] objectAtIndex:backViewCount];
    
    NewEntryViewController* incomingVC = ((NewEntryViewController*) actualViewControllerIWant);
    incomingVC.friends = [self.selectedFriends allObjects];
    
    [self.navigationController popToViewController:incomingVC animated:YES];
}

-(void)newFriend {
    // Get a new friend from the store.
    
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.allFriends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fre"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fre"];
    }
    
    // Configure the cell...
    cell.textLabel.text = [[self.allFriends objectAtIndex:indexPath.row] name];
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Friend *selectedFriend = [self.allFriends objectAtIndex:indexPath.row];
    if (![self.selectedFriends containsObject:selectedFriend]) {
            [self.selectedFriends addObject:selectedFriend];
    } else {
        [self.selectedFriends removeObject:selectedFriend];
    }

}

@end
