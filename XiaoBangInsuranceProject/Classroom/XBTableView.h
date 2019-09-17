//
//  XBTableView.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/16.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "QMUITableView.h"
#import "XBArticleListApi.h"
NS_ASSUME_NONNULL_BEGIN

@interface XBTableView : QMUITableView

@property(nonatomic,weak)XBArticleListApi *api;
@property(nonatomic, copy) NSArray *articleList;


@end

NS_ASSUME_NONNULL_END
