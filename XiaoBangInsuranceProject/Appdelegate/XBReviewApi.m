//
//  XBReviewApi.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/9.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBReviewApi.h"
#import "XBUserDataManger.h"
@interface XBReviewApi ()

@end

@implementation XBReviewApi

-(NSString *)requestUrl{
    return @"insurance/app/review";
}

-(NSDictionary *)parameter{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return @{
             @"device":@"iOS",
             @"version":app_Version//app_Version
             };
}

//-(NSString *)baseUrl{
//    return API_BASE_URL_STRING;
//}

@end
