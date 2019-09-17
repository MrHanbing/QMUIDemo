//
//  XBTableView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/16.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBTableView.h"
#import "XBClassRoomArticleItemCell.h"
#import "XBArticleListModel.h"
#import "XBCommunityTagModel.h"
#import "XBWebViewController.h"
#import "XBHomeFootView.h"

@interface XBTableView ()<QMUITableViewDelegate,QMUITableViewDataSource,XBBaseRequestProtol>



@end

@implementation XBTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}
-(void)setApi:(XBArticleListApi *)api{
    if (_api != api) {
        _api = api;
        api.xb_Requestdelegate = self;
        [api xb_startRequest];
    
    }
}

-(void)xb_request:(id)request  successResponse:(id)responseData{
    if ([request isEqual:self.api]) {
        self.articleList = [XBArticleListModel mj_objectArrayWithKeyValuesArray:[responseData objectForKeySafely:@"items"]];
        [self reloadData];
    }
}

-(void)xb_request:(id)request  requestFailed:(NSString *)message{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.articleList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XBClassRoomArticleItemCell *cell = [XBClassRoomArticleItemCell cellWithTableView:tableView];
    XBArticleListModel *model = [self.articleList objectAtIndexSafely:indexPath.row];
    XBCommunityTagModel *tagModel = [model.tagList objectAtIndexSafely:0];
    [cell xb_cellConfigureArticleTitle:model.article.articleTitle withArticleAuth:model.article.articleAuth withCoverUrl:model.article.coverUrl withReadCount:model.article.readCount withStatus:model.article.status withtagName:tagModel.tagName];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
   
    return [XBHomeFootView initWithXib];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 150;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.00001;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XBArticleListModel *model = [self.articleList objectAtIndexSafely:indexPath.row];
    NSString *url = [NSString stringWithFormat:@"pages/#/article/%d",model.article.articleId];
    
        XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:XBURL_H5Make(url)];
        [self.viewController.navigationController pushViewController:web animated:YES];
}
@end
