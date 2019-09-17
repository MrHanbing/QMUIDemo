//
//  XBGoodsCodeListApi.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBRequest.h"
#import "XBInsuranceCodeListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface XBGoodsCodeListApi : XBRequest

@property(nonatomic, copy) NSArray *items;
@end

NS_ASSUME_NONNULL_END
