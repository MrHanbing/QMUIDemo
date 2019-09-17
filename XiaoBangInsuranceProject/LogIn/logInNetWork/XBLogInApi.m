//
//  XBLogInApi.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/18.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBLogInApi.h"

@implementation XBLogInApi

-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodPOST;
}

- (BOOL)isLoadingAnimate{
    return YES;
}

-(NSString *)requestUrl{
    
    return @"/account/login";
}
- (BOOL)iSShowErrorTip{
    return YES;
}

@end
