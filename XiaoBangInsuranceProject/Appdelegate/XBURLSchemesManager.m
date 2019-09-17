//
//  XBURLSchemesManager.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/4.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBURLSchemesManager.h"
#import "XBWeiXinManager.h"
#import <MagicWindowSDK/MWApi.h>
#import <WechatOpenSDK/WXApi.h>
#import <Growing/Growing.h>


@implementation XBURLSchemesManager
+ (XBURLSchemesManager *)sharedManager {
    static dispatch_once_t onceToken;
    static XBURLSchemesManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [[XBURLSchemesManager alloc] init];
    });
    return manager;
}

-(BOOL)openRouteLink:(NSURL *)url{
    if ([url.host isEqualToString:@"oauth"]){//微信登录
        return [WXApi handleOpenURL:url delegate:(id)[XBWeiXinManager sharedManager]];
    }else  if ([Growing handleUrl:url]) {
        return YES;
    }else{
            [MWApi routeMLink:url];
            return YES;
    }
}


@end
