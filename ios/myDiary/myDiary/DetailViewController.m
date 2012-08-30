//
//  DetailViewController.m
//  myDiary
//
//  Created by hugo on 8/30/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "DetailViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface DetailViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation DetailViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *newEntry = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(newPhoto)];
        self.navigationItem.rightBarButtonItem = newEntry;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
    
}

@end
