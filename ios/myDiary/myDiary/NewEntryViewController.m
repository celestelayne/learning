//
//  NewEntryViewController.m
//  myDiary
//
//  Created by hugo on 8/30/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "NewEntryViewController.h"
#import "DiaryStore.h"
#import "Entry.h"

@interface NewEntryViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *diaryText;

@end

@implementation NewEntryViewController
@synthesize diaryText;


- (IBAction)SavizzleButtonPressed:(id)sender {
    NSLog(@"SAVE BUTTON PRESSED!!!!!?!?");

    [DiaryStore makeNewEntryWithText:diaryText.text];
    [DiaryStore save];
    [self dismissModalViewControllerAnimated:YES];    
}

-(BOOL) textViewShouldReturn:(UITextView *)textView {
    [textView resignFirstResponder];
    return NO;
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
    self.diaryText.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setDiaryText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
