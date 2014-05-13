//
//  CUSAppDelegate.m
//  CUSSerializerExample
//
//  Created by zhangyu on 14-5-12.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "CUSAppDelegate.h"
#import "CUSMainViewController.h"

@implementation CUSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    CUSMainViewController *vc = [[CUSMainViewController alloc]initWithNibName:@"CUSMainViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;
    return YES;
}

@end
