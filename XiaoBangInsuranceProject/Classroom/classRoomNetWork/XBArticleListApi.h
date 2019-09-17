//
//  XBArticleListApi.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface XBArticleListApi : XBRequest

@property(nonatomic, assign)NSInteger pageNum;
@property(nonatomic, assign)NSInteger total;
@property(nonatomic, assign)NSInteger pageSize;
@property(nonatomic, assign)NSInteger tagId;

@property(nonatomic, copy) NSArray *articleList;

@end

NS_ASSUME_NONNULL_END
