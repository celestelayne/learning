//
//  TestViewController.m
//  youtubeTester
//
//  Created by hugo on 8/26/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "TestViewController.h"
#import "YoutubeView.h"

@interface TestViewController ()

@end

@implementation TestViewController





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
    
	// Create view that will act as link to youtube video,
    // centering the view
	YoutubeView *youtubeView = [[YoutubeView alloc] initWithStringAsURL:@"http://www.youtube.com/watch?v=p6sHE2ZYuPI" frame:CGRectMake(100, 50, 120, 120)];
	[[self view] addSubview:youtubeView];
    
    
	YoutubeView *youtubeView2 = [[YoutubeView alloc] initWithStringAsURL:@"http://www.youtube.com/watch?v=p6sHE2ZYuPI" frame:CGRectMake(100, 200, 120, 120)];
	[[self view] addSubview:youtubeView2];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
