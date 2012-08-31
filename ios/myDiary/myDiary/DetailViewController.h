//
//  DetailViewController.h
//  myDiary
//
//  Created by hugo on 8/30/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Entry;

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *entryLabel;
@property (strong, nonatomic) Entry* passingEntry;

@end
