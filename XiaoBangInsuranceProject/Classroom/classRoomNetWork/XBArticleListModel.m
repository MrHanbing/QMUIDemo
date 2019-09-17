//
//  XBArticleListModel.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBArticleListModel.h"
#import "XBCommunityTagModel.h"

@implementation XBArticleItemModel

@end

@implementation XBArticleListModel

+(NSDictionary *)mj_objectClassInArray{
    return @{
             @"tagList":@"XBCommunityTagModel",
             @"article":@"XBArticleItemModel"
             };
}
@end
