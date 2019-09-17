//
//  XBNetWorkConfig.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/8.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBNetWorkConfig.h"
#import <YTKNetwork/YTKNetwork.h>

@implementation XBNetWorkConfig
+(void)xb_configNetWork{
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
#ifdef DEBUG
    //Debug状态下的测试API
    config.baseUrl = @"https://api-qa.xiaobangtouzi.com";
    
#else
    //Release状态下的线上API
    config.baseUrl = @"https://api.xiaobangtouzi.com";
    
#endif

}

+(void)xb_configNetWork:(NSString *)baseUrl{
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.debugLogEnabled = YES;
    config.baseUrl = baseUrl;
    config.debugLogEnabled = YES;
    
}
@end
