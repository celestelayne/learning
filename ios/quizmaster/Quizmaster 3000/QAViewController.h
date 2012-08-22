//
//  QAViewController.h
//  Quizmaster 3000
//
//  Created by Michael Ng on 8/14/12.
//  Copyright (c) 2012 Amherst College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SubmitViewController.h"

@interface QAViewController : UIViewController <SubmitViewControllerDelegate>

- (IBAction)showQuestion:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;

- (IBAction)showAnswer:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *answerLabel;

@end
