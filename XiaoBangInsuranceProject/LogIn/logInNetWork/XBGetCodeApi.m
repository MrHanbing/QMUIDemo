//
//  XBGetCodeApi.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/16.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBGetCodeApi.h"

@implementation XBGetCodeApi


-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

-(NSString *)requestUrl{
    
    return @"/account/get-code";
}
- (BOOL)iSShowErrorTip{
    return YES;
}
- (BOOL)isLoadingAnimate{
    return YES;
}



@end
