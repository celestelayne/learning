//
//  SubmitViewController.h
//  Quizmaster 3000
//
//  Created by Michael Ng on 8/14/12.
//  Copyright (c) 2012 Amherst College. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SubmitViewControllerDelegate <NSObject>
- (void) newSubmission;
@end

@interface SubmitViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *questionTextField;
@property (strong, nonatomic) IBOutlet UITextField *answerTextField;

- (IBAction)submit:(id)sender;
- (IBAction)dismissKeyboard;

@property (nonatomic, weak) id <SubmitViewControllerDelegate> delegate;

@end
