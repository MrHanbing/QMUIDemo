//
//  XBGoodsThemeTypeModel.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBGoodsThemeTypeModel.h"

@implementation XBGoodsThemeTypeModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}
+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"company":@"XBCompanyModel"
             };
}

@end
