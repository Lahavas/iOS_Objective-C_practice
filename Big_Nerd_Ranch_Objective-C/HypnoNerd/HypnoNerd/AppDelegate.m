//
//  AppDelegate.m
//  HypnoNerd
//
//  Created by USER on 2017. 12. 8..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "AppDelegate.h"

#import "HypnosisViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    //    CGRect screenRect = self.window.bounds;
    //    CGRect bigRect = screenRect;
    //    bigRect.size.width *= 2.0;
    //
    //    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    //    HypnosisView *hypnosisView = [[HypnosisView alloc] initWithFrame:screenRect];
    //    screenRect.origin.x += screenRect.size.width;
    //    HypnosisView *anotherHypnosisView = [[HypnosisView alloc] initWithFrame:screenRect];
    //
    //    [scrollView setContentSize:bigRect.size];
    //    [scrollView setPagingEnabled:YES];
    //
    //    [self.window addSubview:scrollView];
    //    [scrollView addSubview:hypnosisView];
    //    [scrollView addSubview:anotherHypnosisView];
    
    HypnosisViewController *hypnosisViewController = [[HypnosisViewController alloc] init];
    
    [self.window setRootViewController:hypnosisViewController];
    
    [self.window setBackgroundColor:UIColor.whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
