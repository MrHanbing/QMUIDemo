//
//  XBAppdelegate_MWDeepLink.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/21.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBAppdelegate_MWDeepLink.h"
#import <MagicWindowSDK/MWApi.h>
#import "XBNewPushWebViewController.h"
#import "XBTabBarViewController.h"
#import "XBNavigationController.h"
@implementation XBAppdelegate_MWDeepLink

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [MWApi setLogEnable:YES];
    [MWApi registerApp:@"J41HT22RFQJ7XBJVOA2V19F1SSRPCQDM"];
    [self registerMlink];
    
    return YES;
}

//通过universal link来唤起app
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler
{
    //必写
    return  [MWApi continueUserActivity:userActivity];
}


- (void)registerMlink
{
    [MWApi registerMLinkDefaultHandler:^(NSURL * _Nonnull url, NSDictionary * _Nullable params) {
        
        //URL和mlinkKey匹配不上，自行处理URL,进行跳转
    }];
    
    @weakify(self);
    [MWApi registerMLinkHandlerWithKey:@"advice" handler:^(NSURL * _Nonnull url, NSDictionary * _Nullable params) {
        @strongify(self);
        XBNewPushWebViewController * web = [[ XBNewPushWebViewController alloc]initWithURLString:XBURL_H5Make(XB_Consult_H5Address)];
          UIViewController *visibleViewController = [QMUIHelper visibleViewController];
        [visibleViewController.navigationController pushViewController:web animated:YES];
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//onReq:(BaseReq *)req方法为WXApiDelegate的方法
//-(void)onReq:(BaseReq *)req
//{
//    if ([req isKindOfClass:[LaunchFromWXReq class]])
//    {
//        LaunchFromWXReq *request = (LaunchFromWXReq *)req;
//        NSString *appParameter = request.message.messageExt;
//        if (appParameter != nil && appParameter.length > 0)
//        {
//            //必须写
//            [MWApi routeMLink:[NSURL URLWithString:appParameter]];
//        }
//    }
//}
@end
