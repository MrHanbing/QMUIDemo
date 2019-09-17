//
//  XBWeiXinAPi.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/4.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBWeiXinAPi.h"

@implementation XBWeiXinAPi


- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}
- (NSString *)requestUrl{
    
    return @"user-center/wechat/callback-app";
}
-(BOOL)isLoadingAnimate{
    return YES;
}
-(BOOL)iSShowErrorTip{
    return YES;
}
@end
