//
//  AppDelegate.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

@interface AppDelegate () {
    UIWindow *window;
}
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    [window makeKeyAndVisible];
    
    FirstViewController *firstViewController = FirstViewController.new;
    UINavigationController *navigationController = [UINavigationController.alloc init];
    [navigationController setNavigationBarHidden:YES];
    
    window.rootViewController = navigationController;
    
    self.imgNewView = [[UIImageView alloc]initWithFrame:firstViewController.view.frame];
    self.imgOldView = [[UIImageView alloc]initWithFrame:firstViewController.view.frame];
    self.imgNewView.alpha = 0;
    self.imgOldView.alpha = 1;
    self.imgOldView.tag = 1;
    self.imgNewView.tag = 2;
    [navigationController.view addSubview:self.imgOldView];
    [navigationController.view addSubview:self.imgNewView];
    [navigationController addChildViewController:firstViewController];
    [navigationController.view addSubview:firstViewController.view];
    return YES;
}

@end