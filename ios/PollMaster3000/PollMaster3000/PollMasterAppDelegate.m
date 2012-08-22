//
//  PollMasterAppDelegate.m
//  PollMaster3000
//
//  Created by hugo on 8/17/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <Parse/Parse.h>
#import "PollMasterAppDelegate.h"
#import "CreatePollViewController.h"
#import "AnswerPollViewController.h"
#import "ResultsPollViewController.h"
#import "PollStore.h"

@implementation PollMasterAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    // Create one of each of three view controllers
    CreatePollViewController* pollViewController = [CreatePollViewController new];
    AnswerPollViewController* answerViewController = [AnswerPollViewController new];
    ResultsPollViewController* resultViewController = [ResultsPollViewController new];
    
    // Call The Parse Thingy.
    [PollStore setUpParseTable];
    
    // Add titles for each (shown at the bottom tab view).
    pollViewController.title = @"Poll View";
    answerViewController.title = @"Answer View";
    resultViewController.title = @"Result View";
    
    // Wrap our answer view in a navigation controller. Add functionality for multiple polls.
    UINavigationController* answerNavigationViewController = [[UINavigationController alloc] initWithRootViewController:answerViewController];
    
    // Create a tab bar controller that switches between three different views.
    UITabBarController* tabBarController = [UITabBarController new];
    tabBarController.viewControllers = [NSArray arrayWithObjects:pollViewController, answerNavigationViewController, resultViewController, nil];
    self.window.rootViewController =  tabBarController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
