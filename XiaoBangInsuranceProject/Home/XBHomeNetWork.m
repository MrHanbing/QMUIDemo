//
//  XBHomeNetWork.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBHomeNetWork.h"
#import <YTKNetwork/YTKNetwork.h>
#import "XBInsuranceCodeListModel.h"
#import "XBGoodsCodeListApi.h"
#import "XBHomeGoodsThemeTypeApi.h"
#import "XBArticleAllApi.h"
#import "XBGoodsThemeTypeModel.h"
#import "XBArticleListModel.h"
@interface XBHomeNetWork()<YTKChainRequestDelegate,XBBaseRequestProtol>

@property(nonatomic, strong) XBGoodsCodeListApi *codeListApi;
@property(nonatomic, strong) YTKBatchRequest *batchRequest;

//@property(nonatomic, strong) XBArticleListApi *articleListApi;


@end

@implementation XBHomeNetWork
-(void)chainRequest{
    [self.codeListApi xb_startRequest];
}


- (XBGoodsCodeListApi *)codeListApi{
    if (!_codeListApi) {
        _codeListApi = [[XBGoodsCodeListApi alloc]init];
        _codeListApi.parameter = @{
                                    @"codeType":@"goodsThemeType"
                                    };
        _codeListApi.xb_Requestdelegate = self;
    }
    return _codeListApi;
}

-(void)xb_request:(id)request  successResponse:(id)responseData{
    if (responseData) {
      self.tagItems = [XBInsuranceCodeListModel mj_objectArrayWithKeyValuesArray:[responseData objectForKeySafely:@"items"]];
        [self _requestTagDetailList];
    }
}
-(void)_requestTagDetailList{
    NSMutableArray *apiArray = [NSMutableArray array];
    for (XBInsuranceCodeListModel *model in  self.tagItems) {
        
        XBHomeGoodsThemeTypeApi *api = [[XBHomeGoodsThemeTypeApi alloc]init];
        api.parameter = @{
                          @"themeType":model.codeCode,
                          @"pageSize":@(5)
                          };
        [apiArray addObject:api];
      
    }
    XBArticleAllApi *api = [[XBArticleAllApi alloc]init];
    [apiArray addObject:api];
     self.batchRequest = [[YTKBatchRequest alloc] initWithRequestArray:apiArray];
    [ self.batchRequest startWithCompletionBlockWithSuccess:^(YTKBatchRequest * _Nonnull batchRequest) {
         NSArray *requests = batchRequest.requestArray;
        for (XBRequest *api  in requests) {
            if ([api isKindOfClass:[XBHomeGoodsThemeTypeApi class]]) {
                [self parseGoodsList:api];
            }else{
                [self parseArticleList:api];
            }
          
        }
        if (self.requestSucessBlock) {
            self.requestSucessBlock();
        }
        
    } failure:^(YTKBatchRequest * _Nonnull batchRequest) {
        
    }];
}
-(void)parseArticleList:(XBArticleAllApi *)api{
    if (api.responseJSONObject) {
        NSInteger status = [[api.responseJSONObject objectForKeySafely:@"status"] integerValue];
        NSInteger code =  [[api.responseJSONObject objectForKeySafely:@"code"] integerValue];
        if (status == 200 && code == 0) {
            NSDictionary *dic  =  [api.responseJSONObject objectForKeySafely:@"data"];
           self.articleList =  [XBArticleListModel mj_objectArrayWithKeyValuesArray:[dic objectForKeySafely:@"items"]];
        }
    }
}
- (void)parseGoodsList:(XBHomeGoodsThemeTypeApi *)api{
    if (api.responseJSONObject) {
        NSInteger status = [[api.responseJSONObject objectForKeySafely:@"status"] integerValue];
        NSInteger code =  [[api.responseJSONObject objectForKeySafely:@"code"] integerValue];
        if (status == 200 && code == 0) {
            NSDictionary *dic  =  [api.responseJSONObject objectForKeySafely:@"data"];
            for (int i  = 0; i < self.tagItems.count; i ++) {
                XBInsuranceCodeListModel *listModel = self.tagItems[i];
                if ([listModel.codeCode isEqualToString: api.parameter [@"themeType"]]) {
                    listModel.xbItem =[XBGoodsThemeTypeModel mj_objectArrayWithKeyValuesArray:[dic objectForKeySafely:@"items"]];
                }
            }
        }
    }
    
}


-(void)xb_request:(id)request  requestFailed:(NSString *)message{
    
}
@end
