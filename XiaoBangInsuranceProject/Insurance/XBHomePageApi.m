//
//  XBHomePageApi.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBHomePageApi.h"
#import "XBUserDataManger.h"

@implementation XBHomePageApi


-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

-(NSString *)requestUrl{
    
    return @"/insurance/family/homepage";
}
-(NSDictionary *)requestHeaderFieldValueDictionary{
        return @{
                 @"X-Request-Token":[[XBUserDataManger defultManger]accessToken]
                 };
}
-(NSDictionary *)parameter{
    
    return @{
            @"number": @(2)
             };
}

@end
