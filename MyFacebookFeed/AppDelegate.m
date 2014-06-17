//
//  AppDelegate.m
//  MyFacebookFeed
//
//  Created by Om Pathipaka on 6/6/14.
//  Copyright (c) 2014 Om Pathipaka. All rights reserved.
//

#import "AppDelegate.h"
#import "FeedViewController.h"
#import "FeedHomeViewController.h"
#import "RequestsViewController.h"
#import "MessagesViewController.h"
#import "NotificationsViewController.h"
#import "MoreViewController.h"
#import "SignInViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //creating sign-in view
   SignInViewController *svc = [[SignInViewController alloc] init];
/*
    
    //Create UIViewControllers for different tabs  //
    FeedHomeViewController *hvc = [[FeedHomeViewController alloc] init];
    RequestsViewController *rvc = [[RequestsViewController alloc] init];
    MessagesViewController *mvc = [[MessagesViewController alloc] init];
    NotificationsViewController *notvc = [[NotificationsViewController alloc] init];
    MoreViewController *morevc = [[MoreViewController alloc] init];
    
    //Setting the navigation controller for each UIView Controller//
    UINavigationController *n_hvc = [[UINavigationController alloc] initWithRootViewController:hvc];
    UINavigationController *n_rvc = [[UINavigationController alloc] initWithRootViewController:rvc];
    UINavigationController *n_mvc = [[UINavigationController alloc] initWithRootViewController:mvc];
    UINavigationController *n_notvc = [[UINavigationController alloc] initWithRootViewController:notvc];
    UINavigationController *n_morevc = [[UINavigationController alloc] initWithRootViewController:morevc];
    
    //adding title and image to each tab and customizing appearance of the navigations bars
    n_hvc.tabBarItem.title = @"New Feed";
    n_hvc.tabBarItem.image = [UIImage imageNamed:@"feed_tab_img"];
    n_hvc.navigationBar.barTintColor = [UIColor colorWithRed:68.0/255.0 green:99.0/255.0 blue:161.0/255.0 alpha:1.0];
    n_hvc.navigationBar.tintColor = [UIColor whiteColor];
    n_hvc.navigationBar.translucent = NO;
    
    n_mvc.tabBarItem.title = @"Messages";
    n_mvc.tabBarItem.image = [UIImage imageNamed:@"messages_tab_img"];
    n_mvc.navigationBar.barTintColor = [UIColor colorWithRed:68.0/255.0 green:99.0/255.0 blue:161.0/255.0 alpha:1.0];
    n_mvc.navigationBar.tintColor = [UIColor whiteColor];
    n_mvc.navigationBar.translucent = NO;
    
    n_morevc.tabBarItem.title = @"More";
    n_morevc.tabBarItem.image = [UIImage imageNamed:@"more_tab_img"];
    n_morevc.navigationBar.barTintColor = [UIColor colorWithRed:68.0/255.0 green:99.0/255.0 blue:161.0/255.0 alpha:1.0];
    n_morevc.navigationBar.tintColor = [UIColor whiteColor];
    n_morevc.navigationBar.translucent = NO;
    
    n_rvc.tabBarItem.title = @"Requests";
    n_rvc.tabBarItem.image = [UIImage imageNamed:@"requests_tab_img"];
    n_rvc.navigationBar.barTintColor = [UIColor colorWithRed:68.0/255.0 green:99.0/255.0 blue:161.0/255.0 alpha:1.0];
    n_rvc.navigationBar.tintColor = [UIColor whiteColor];
    n_rvc.navigationBar.translucent = NO;
    
    n_notvc.tabBarItem.title = @"Notifications";
    n_notvc.tabBarItem.image = [UIImage imageNamed:@"notifications_tab_img"];
    n_notvc.navigationBar.barTintColor = [UIColor colorWithRed:68.0/255.0 green:99.0/255.0 blue:161.0/255.0 alpha:1.0];
    n_notvc.navigationBar.tintColor = [UIColor whiteColor];
    n_notvc.navigationBar.translucent = NO;
    
    
    // Create the tab bar controller
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[n_hvc, n_rvc, n_mvc, n_notvc, n_morevc];
*/
    NSLog(@"about to set root view");
    self.window.rootViewController = svc;
    // self.window.rootViewController = tabBarController;
    
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
