//
//  DisplayAnswerPollViewController.h
//  PollMaster3000
//
//  Created by hugo on 8/20/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayAnswerPollViewController : UIViewController

@property (strong) NSString *question;
@property (strong) NSString *questionID;

@property (strong) UITableViewCell *currentCell;

@end
