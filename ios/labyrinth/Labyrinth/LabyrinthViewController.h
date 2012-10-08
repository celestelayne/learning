//
//  LabyrinthViewController.h
//  Labyrinth
//
//  Created by hugo on 9/3/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabyrinthView.h"

@interface LabyrinthViewController : UIViewController

-(void)sendAllData;
@property (strong) CALayer *ball;

@end
