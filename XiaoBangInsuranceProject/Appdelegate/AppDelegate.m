//
//  AppDelegate.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/8.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "AppDelegate.h"
//#import "QDUIHelper.h"
//#import "QDCommonUI.h"
#import "XBURLSchemesManager.h"
#import "XBNetWorkConfig.h"
#import "AppDelegate+XBRootController.h"
#import <FLEX/FLEX.h>
//#import <MNFloatBtn/MNFloatBtn.h>
#import <FRDModuleManager/FRDModuleManager.h>
#import "XBReviewApi.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"XB_ModuleRegister" ofType:@"plist"];
    
    FRDModuleManager *manager = [FRDModuleManager sharedInstance];
    [manager loadModulesWithPlistFile:plistPath];
    return YES;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.isWeb = YES;
    [[FRDModuleManager sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    

    [XBNetWorkConfig xb_configNetWork];
    [self xb_appdelegateConfigurationRootController];

    return YES;
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{

    return [[XBURLSchemesManager sharedManager]openRouteLink:url];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(nonnull NSDictionary *)options
{
    //必写
     return [[XBURLSchemesManager sharedManager]openRouteLink:url];
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
