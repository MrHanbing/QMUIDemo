//
//  XBAppDelegate_GrowingIO.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/21.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBAppDelegate_GrowingIO.h"
#import <Growing/Growing.h>
@implementation XBAppDelegate_GrowingIO
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"%@  Group", NSStringFromSelector(_cmd));
          [Growing startWithAccountId:@"b7b689b841ccade6"];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"%@  Group", NSStringFromSelector(_cmd));
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"%@  Group", NSStringFromSelector(_cmd));
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"%@  Group", NSStringFromSelector(_cmd));
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"%@  Group", NSStringFromSelector(_cmd));
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"%@  Group", NSStringFromSelector(_cmd));
}
@end
