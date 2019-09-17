//
//  XBArticleAllApi.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBArticleAllApi.h"

@implementation XBArticleAllApi
-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}
-(NSString *)requestUrl{
    
    return @"/community/article-all/get";
}
@end
