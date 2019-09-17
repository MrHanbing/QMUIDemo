//
//  AppDelegate+XBRootController.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/18.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "AppDelegate+XBRootController.h"
#import "XBUserDataManger.h"
#import "XBNavigationController.h"
#import "XBTabBarViewController.h"
#import "XBPersonController.h"
#import "XBClassRoomController.h"
#import "XBInsuranceController.h"
#import "XBHomeController.h"
#import "XBLogInViewController.h"
#import "XBNewWebViewController.h"
#import "XBCommon_H5Address.h"
#import "XBReviewApi.h"
#import <XHLaunchAd/XHLaunchAd.h>

@interface AppDelegate ()<XHLaunchAdDelegate>

@end

@implementation AppDelegate (XBRootController)

-(void)xb_cutAppdelegateRootController{
    
    [self xb_appdelegateConfigurationRootController];
}

-(void)xb_appdelegateConfigurationRootController{
    if (self.window == nil) {
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.backgroundColor = [UIColor whiteColor];
    }
    [self xb_requestConfig];
}

-(void)xb_requestConfig{
    [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];
    [XHLaunchAd setWaitDataDuration:3];

    if ([XBUserDataManger defultManger].isAppStoreReview == NO) {
        [self xb_cutNativeOrWeb:NO];
    }else{
        [self xb_cutNativeOrWeb:YES];
        return;
    }
self.reviewApi  = [[XBReviewApi alloc]init];
   @ weakify(self);
    [self.reviewApi    startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSInteger status = [[request.responseJSONObject objectForKeySafely:@"status"] integerValue];
        NSInteger code =  [[request.responseJSONObject objectForKeySafely:@"code"] integerValue];
        @strongify(self);
        if (status == 200 && (code == 200 || code == 0)) {
            NSDictionary *dic =  [request.responseJSONObject objectForKeySafely:@"data"];
            BOOL isStatus = [[dic objectForKeySafely:@"status"] boolValue];
            [[XBUserDataManger defultManger ]saveAppStoreReview:!isStatus];
            XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration defaultConfiguration];
            imageAdconfiguration.imageNameOrURLString = @"iphone_launch.png";
            imageAdconfiguration.showEnterForeground = NO;
            imageAdconfiguration.duration = 2;
            imageAdconfiguration.skipButtonType = SkipTypeNone;
            imageAdconfiguration.showFinishAnimate = ShowFinishAnimateFadein;
            if ([XBUserDataManger defultManger].isAppStoreReview == NO) {
                [self xb_cutNativeOrWeb:NO];
            }else{
                [self xb_cutNativeOrWeb:YES];
            }
            [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration];
        }else{

        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {

    }];
}

//- (XBReviewApi *)reViewApi{
//    if (!_re) {
//        <#statements#>
//    }
//}
//-(void)xhLaunchAdShowFinish:(XHLaunchAd *)launchAd{
//
//}
- (void)xb_cutNativeOrWeb:(BOOL)isWeb{
    if (!isWeb) {
        self.isWeb = NO;
        XBTabBarViewController *tabBarViewController = [[XBTabBarViewController alloc] init];
        [tabBarViewController xb_createTabBarCtrConfigerChildsCtr:[self _createNativeCtrs] withTitles:[self _createTitles] withDefultIcon:[self _createDefultIcons] withSelectIcons:[self _createSelectIcons]];
        self.window.rootViewController = tabBarViewController;
        [self.window makeKeyAndVisible];
    } else {      self.isWeb = YES;
        XBTabBarViewController *tabBarViewController = [[XBTabBarViewController alloc] init];
        [tabBarViewController xb_createTabBarCtrConfigerChildsCtr:[self _createWebChildsCtr] withTitles:[self _createTitles] withDefultIcon:[self _createDefultIcons] withSelectIcons:[self _createSelectIcons]];
        self.window.rootViewController = tabBarViewController;
        [self.window makeKeyAndVisible];
    }
    
}
-(void)_createTab{
    
    XBLogInViewController *logIn = [[XBLogInViewController alloc]init];
    logIn.hidesBottomBarWhenPushed = NO;
    XBNavigationController *logInNav = [[XBNavigationController alloc] initWithRootViewController:logIn];
    self.window.rootViewController = logInNav;
    [self.window makeKeyAndVisible];
    
}
- (void)_createTabBarController {
    
    XBTabBarViewController *tabBarViewController = [[XBTabBarViewController alloc] init];
    [tabBarViewController xb_createTabBarCtrConfigerChildsCtr:[self _createNativeCtrs] withTitles:[self _createTitles] withDefultIcon:[self _createDefultIcons] withSelectIcons:[self _createSelectIcons]];
    self.window.rootViewController = tabBarViewController;
    [self.window makeKeyAndVisible];
}


-(NSArray *)_createNativeCtrs{
     XBHomeController *home = [[XBHomeController alloc]init];
     home.hidesBottomBarWhenPushed = NO;
     XBClassRoomController *classRoom = [[XBClassRoomController alloc]init];
     classRoom.hidesBottomBarWhenPushed = NO;
     XBInsuranceController *insurance = [[XBInsuranceController alloc]init];
     insurance.hidesBottomBarWhenPushed = NO;
     XBPersonController *mine = [[XBPersonController alloc]init];
     mine.hidesBottomBarWhenPushed = NO;
    return @[home,classRoom,insurance,mine];
}

- (NSArray *)_createWebChildsCtr{
     XBNewWebViewController *home = [[XBNewWebViewController alloc] initWithURLString:XBURL_H5Make(XB_Tab_Home_H5Address)];
    home.hidesBottomBarWhenPushed = NO;
    XBNewWebViewController *classRoom = [[XBNewWebViewController alloc] initWithURLString:XBURL_H5Make(XB_Tab_ClassRoom_H5Address)];
    classRoom.hidesBottomBarWhenPushed = NO;
    
    XBNewWebViewController *insurance = [[XBNewWebViewController alloc] initWithURLString:XBURL_H5Make(XB_Tab_Insurance_H5Address)];
     insurance.hidesBottomBarWhenPushed = NO;
    XBNewWebViewController *mine = [[XBNewWebViewController alloc]initWithURLString:XBURL_H5Make(XB_Tab_Mine_H5Address)];
    mine.hidesBottomBarWhenPushed = NO;

    
    return @[home,classRoom,insurance,mine];
}
-(NSArray *)_createTitles{
    
    return @[@"首页",@"课堂",@"保障",@"我的"];
}
-(NSArray *)_createDefultIcons{
    
    return @[@"tabBar_Home",@"tabBar_ClassRoom",@"tabBar_Insurance",@"tabBar_Person"];
}
-(NSArray *)_createSelectIcons{
    
    return @[@"tabBar_Home_Select",@"tabBar_ClassRoom_Select",@"tabBar_Insurance_select",@"tabBar_Person_Select"];
}
@end
