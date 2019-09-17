//
//  XBGoodsCodeListApi.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBGoodsCodeListApi.h"
#import "XBInsuranceCodeListModel.h"
@implementation XBGoodsCodeListApi


-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}
-(NSString *)requestUrl{
    
    return @"/insurance/code/list";
}




@end
