//
//  XBInsuranceHomePageModel.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBInsuranceFamilyDTO :NSObject
@property(nonatomic, assign) NSInteger age;
@property(nonatomic, assign) NSInteger ID;
@property(nonatomic, assign) NSInteger userId;
@property(nonatomic, assign) NSInteger role;
@property(nonatomic, copy)   NSString *name;

@property(nonatomic, copy, readonly) NSString *icon;
@end

@interface XBInsuranceHomePageInsurances : NSObject

@property(nonatomic, assign) NSInteger amount;
@property(nonatomic, assign) NSInteger policyNum;
@property(nonatomic, assign) NSInteger preeminentAmount;
@property(nonatomic, copy)   NSString *name;

@end


@interface XBInsuranceGoodTypeListItem : NSObject

@property(nonatomic, assign) CGFloat baseCredit;
@property(nonatomic, copy) NSString *companyLogo;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *suggest;
@property(nonatomic, copy) NSString *tags;
@property(nonatomic, assign) NSInteger productId;
@property(nonatomic, assign) NSInteger source;
@end


@interface XBInsuranceGoodTypeList : NSObject

@property(nonatomic, copy) NSString *goodsType;

@property(nonatomic, strong) NSArray *list;
@end

@interface XBInsuranceHomePageModel : NSObject
@property(nonatomic, strong) XBInsuranceFamilyDTO *familyDTO;
@property(nonatomic, strong) NSArray *insurances;
@property(nonatomic, strong) NSArray *list;
@end

NS_ASSUME_NONNULL_END
