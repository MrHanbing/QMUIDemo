//
//  XBClassRoomNetWork.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/28.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBClassRoomNetWork.h"
#import "XBCommunityTagGetApi.h"
#import <YTKNetwork/YTKNetwork.h>
#import "XBArticleListApi.h"
#import "XBCommunityTagModel.h"
#import "XBArticleListModel.h"

@interface XBClassRoomNetWork()<YTKChainRequestDelegate,XBBaseRequestProtol>
@property(nonatomic, strong) XBCommunityTagGetApi *tagGetApi;
@property(nonatomic, strong) YTKChainRequest *chainReq;
@property(nonatomic, strong) XBArticleListApi *articleListApi;

@end

@implementation XBClassRoomNetWork


-(void)chainRequest{
    
    self.chainReq = [[YTKChainRequest alloc] init];
    @weakify(self);
    [self.chainReq addRequest:self.tagGetApi callback:^(YTKChainRequest * _Nonnull chainRequest, YTKBaseRequest * _Nonnull baseRequest) {
         @strongify(self);
        XBCommunityTagModel *model = self.tagGetApi.tagList.firstObject;
        [self requestAllArticle];
    }];
      self.chainReq.delegate = self;
    [self.chainReq start];

}

- (void)chainRequest_articleListApi:( XBCommunityTagModel *)model{
    [self.chainReq addRequest: self.articleListApiList.firstObject callback:^(YTKChainRequest * _Nonnull chainRequest, YTKBaseRequest * _Nonnull baseRequest) {
        
    }];
}
- (void)xb_requestArticleList:(NSInteger)tag{
    [self xb_requestArticleList:tag withPageNum:0];
}

-(void)xb_requestArticleList:(NSInteger)tag withPageNum:(NSInteger)page{
    for (XBArticleListApi *api  in self.articleListApiList) {
        if (api.tag == tag) {
            [api xb_startRequest];
        }
    }
}

- (void)requestAllArticle{
    self.articleListApiList = [[NSMutableArray alloc]init];
    for (XBCommunityTagModel *tagModel in self.tagGetApi.tagList) {
        XBArticleListApi *api = [[XBArticleListApi alloc]init];
        api.tagId = tagModel.tagId;
        api.tag = tagModel.tagId;
        api.pageNum = 0;
        api.pageSize = 20;
        [self.articleListApiList addObject:api];
    }
}

- (NSArray *)tagList{
    return self.tagGetApi.tagList;
}
- (void)chainRequestFinished:(YTKChainRequest *)chainRequest {
    if (self.requestBlock) {
        self.requestBlock();
    }
}

-(NSArray *)getArticleList:(NSInteger)index{
    XBArticleListApi *api =   [self.articleListApiList objectAtIndex:index];
    if (api.articleList.count <= 0) {
        [api xb_startRequest];
        return @[];
    }
    return api.articleList;
}

- (void)chainRequestFailed:(YTKChainRequest *)chainRequest failedBaseRequest:(YTKBaseRequest*)request {
    
   
}


-(XBCommunityTagGetApi *)tagGetApi{
    if (!_tagGetApi) {
        _tagGetApi = [[XBCommunityTagGetApi alloc]init];
    }
    return _tagGetApi;
}
-(XBArticleListApi *)articleListApi{
    if (!_articleListApi) {
        _articleListApi = [[XBArticleListApi alloc]init];
    }
    return _articleListApi;
}


-(void)xb_request:(id)request  successResponse:(id)responseData{
    
    XBArticleListApi *api = request;
    api.articleList = [XBArticleListModel mj_objectArrayWithKeyValuesArray:[responseData objectForKeySafely:@"items"]];
}

-(void)xb_request:(id)request  requestFailed:(NSString *)message{
    
}

@end
