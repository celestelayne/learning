//
//  AppDelegate.m
//  FoodMap
//
//  Created by hugo on 9/8/12.
//  Copyright (c) 2012 Hugo Melo. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "TabViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [Parse setApplicationId:@"inPkVs6Fy4x5KTNWJga3CXmPpKaqLTSVbqtj6cSF"
                  clientKey:@"ZuKAel15FVbwIMIB6MrdfJFS1K4GUireH3BD25Ue"];
    
    [PFTwitterUtils initializeWithConsumerKey:@"61GxoLdaBEtR7r49DVhPA"
                               consumerSecret:@"5vwUmmfcRW18TBJ4tQsz0JHUHMgFRYGC4UIbmDGj928"];

    // To push and pop modal views.
    TabViewController *tabVC = [TabViewController new];
    UINavigationController *tabNavigationVC = [[UINavigationController alloc] initWithRootViewController:tabVC];
    tabNavigationVC.navigationBarHidden = YES;
    self.window.rootViewController = tabNavigationVC;
    
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
