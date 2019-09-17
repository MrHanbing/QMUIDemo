//
//  XBArticleListModel.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBArticleItemModel : NSObject
@property(nonatomic, assign) NSInteger createdAt;
@property(nonatomic, assign) NSInteger updatedAt;
@property(nonatomic, assign) NSInteger ID;
@property(nonatomic, assign) NSInteger articleId;
@property(nonatomic, assign) NSInteger productId;
@property(nonatomic, assign) NSInteger status;
@property(nonatomic, assign) NSInteger readCount;
@property(nonatomic, copy) NSString *articleTitle;
@property(nonatomic, copy) NSString *articleAuth;
@property(nonatomic, copy) NSString *coverUrl;
@end

@interface XBArticleListModel : NSObject
@property(nonatomic, strong) XBArticleItemModel *article;
@property(nonatomic, copy) NSArray *tagList;
@end

NS_ASSUME_NONNULL_END
