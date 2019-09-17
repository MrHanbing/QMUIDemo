//
//  XBGoodsThemeTypeModel.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XBCompanyModel.h"
NS_ASSUME_NONNULL_BEGIN



@interface XBGoodsThemeTypeModel : NSObject
@property(nonatomic, assign) NSInteger ID;
@property(nonatomic, assign) NSInteger productId;
@property(nonatomic, assign) NSInteger companyId;
@property(nonatomic, copy) NSString *goodsCode;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *goodsType;
@property(nonatomic, copy) NSString *marketingTags;
@property(nonatomic, copy) NSString *baseCredit;
@property(nonatomic, strong) XBCompanyModel *company;
@property(nonatomic, strong) NSArray *imageUrlList;
@property(nonatomic, strong) NSArray *faqUrlList;
@end

NS_ASSUME_NONNULL_END
