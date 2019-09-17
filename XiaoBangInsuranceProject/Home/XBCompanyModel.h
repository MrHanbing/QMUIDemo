//
//  XBCompanyModel.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBCompanyModel : NSObject
@property(nonatomic, assign) NSInteger ID;
@property(nonatomic, assign) NSInteger createdAt;
@property(nonatomic, assign) NSInteger updatedAt;
@property(nonatomic, assign)NSInteger deletedAt;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *shortName;
@property(nonatomic, copy) NSString *categoryName;
@property(nonatomic, copy) NSString *logo;
@end

NS_ASSUME_NONNULL_END
