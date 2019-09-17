//
//  XBInsuranceHomePageModel.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBInsuranceHomePageModel.h"
#import <MJExtension/MJExtension.h>


@implementation XBInsuranceFamilyDTO

+ (NSDictionary *) mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

@end

@implementation XBInsuranceHomePageInsurances

@end


@implementation XBInsuranceGoodTypeListItem

@end


@implementation XBInsuranceGoodTypeList

+(NSDictionary *)mj_objectClassInArray{
    return @{
             @"list":@"XBInsuranceGoodTypeListItem"
             };
}

@end

@implementation XBInsuranceHomePageModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"list" : @"XBInsuranceGoodTypeList",
             @"insurances" : @"XBInsuranceHomePageInsurances",
             };
}

@end
