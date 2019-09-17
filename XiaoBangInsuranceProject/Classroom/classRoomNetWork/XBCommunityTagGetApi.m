//
//  XBCommunityTagGetApi.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/28.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBCommunityTagGetApi.h"
#import "XBCommunityTagModel.h"

@implementation XBCommunityTagGetApi


-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

-(NSString *)requestUrl{
    
    return @"/community/tag/get";
}

-(NSArray *)tagList{
    NSMutableArray *arr = [NSMutableArray array];
    if (self.responseJSONObject) {
        NSInteger status = [[self.responseJSONObject objectForKeySafely:@"status"] integerValue];
        NSInteger code =  [[self.responseJSONObject objectForKeySafely:@"code"] integerValue];
        if (status == 200 && code == 0) {
            NSDictionary *dic  =  [self.responseJSONObject objectForKeySafely:@"data"];
            arr = [XBCommunityTagModel mj_objectArrayWithKeyValuesArray:[dic objectForKeySafely:@"items"]];
            XBCommunityTagModel *model =   arr.lastObject;
            if (model.tagId == 100005) {
                [arr removeLastObject];
                [arr insertObject:model atIndex:0];
            }
        }

    }
    return arr;
}

@end
