//
//  XBArticleListApi.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBArticleListApi.h"
#import "XBArticleListModel.h"

@implementation XBArticleListApi

-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

-(NSString *)requestUrl{
    
    return @"/community/article/search/master";
}
-(NSDictionary *)parameter{
 return    @{
      @"pageSize":@(self.pageSize),
      @"pageNum":@(self.pageNum),
      @"tags":[NSString stringWithFormat:@"%ld",self.tagId]
      };
}

- (NSArray *)articleList{
    NSMutableArray *arr = [NSMutableArray array];
    if (self.responseJSONObject) {
        NSInteger status = [[self.responseJSONObject objectForKeySafely:@"status"] integerValue];
        NSInteger code =  [[self.responseJSONObject objectForKeySafely:@"code"] integerValue];
        if (status == 200 && code == 0) {
            NSDictionary *dic  =  [self.responseJSONObject objectForKeySafely:@"data"];
            arr = [XBArticleListModel mj_objectArrayWithKeyValuesArray:[dic objectForKeySafely:@"items"]];
        }
    }
    return arr;
    
}



@end
