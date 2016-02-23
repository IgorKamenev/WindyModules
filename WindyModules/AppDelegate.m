//
//  AppDelegate.m
//  WindyModules
//
//  Created by Igor Kamenev on 13/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import "AppDelegate.h"
#import "ExampleTableWireframe.h"
#import "MyProfileViewController.h"
#import "UsersProfileViewController.h"
#import "UserListViewController.h"
#import "SpotFeedbackViewController.h"
#import "UIColor+AllColors.h"

@interface AppDelegate ()

@property (nonatomic) UITabBarController *tabBar;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.tabBar = [[UITabBarController alloc] init];
    self.tabBar.viewControllers = @[ [[UINavigationController alloc] initWithRootViewController:[MyProfileViewController new]],
                                     [[UINavigationController alloc] initWithRootViewController:[UsersProfileViewController new]],
                                     [[UINavigationController alloc] initWithRootViewController:[UserListViewController new]],
                                     [[UINavigationController alloc] initWithRootViewController:[SpotFeedbackViewController new]] ];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = self.tabBar;
    
    [self.window makeKeyAndVisible];
    
    [self customizeNavigationBar];
    
    return YES;
}

- (void)customizeNavigationBar
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor baseColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"NavBar"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}


@end