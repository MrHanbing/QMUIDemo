//
//  XBHomeGoodsThemeTypeApi.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBHomeGoodsThemeTypeApi.h"

@implementation XBHomeGoodsThemeTypeApi
-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}
-(NSString *)requestUrl{
    
    return @"/insurance/goods/info/theme-type";
}

@end
