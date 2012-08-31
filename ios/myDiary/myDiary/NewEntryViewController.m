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
#import "FriendTableViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface NewEntryViewController () <UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *diaryText;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation NewEntryViewController
@synthesize diaryText;
@synthesize imageView;



   

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
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(save)];
    UIBarButtonItem *newEntry = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(newPhoto)];
    UIBarButtonItem *tagFriend = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newFriend)];
    self.navigationItem.rightBarButtonItems = @[save, newEntry, tagFriend];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)viewDidUnload
{
    [self setDiaryText:nil];
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  // Resign first responder later on...
}

-(void)newPhoto {
    UIImagePickerController* photo = [UIImagePickerController new];
    photo.sourceType = UIImagePickerControllerSourceTypeCamera;
    photo.mediaTypes = [NSArray arrayWithObject:(NSString*)kUTTypeImage];
    photo.delegate = self;
    
    photo.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:photo animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    self.imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) save {
    [DiaryStore makeNewEntryWithText:diaryText.text AndWithImage:self.imageView.image];
    [DiaryStore save];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) newFriend {
    FriendTableViewController *friendVC = [FriendTableViewController new];
    [self.navigationController pushViewController:friendVC animated:YES];
}
@end
