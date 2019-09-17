//
//  XBInsuranceCodeListModel.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBInsuranceCodeListModel : NSObject
@property(nonatomic, assign) NSInteger ID;
@property(nonatomic, assign) NSInteger deletedAt;
@property(nonatomic, assign) NSInteger updatedAt;
@property(nonatomic, assign) NSInteger createdAt;
@property(nonatomic, assign) NSInteger status;
@property(nonatomic, assign) NSInteger sortNo;

@property(nonatomic, copy) NSString *codeType;
@property(nonatomic, copy) NSString *codeTypeName;
@property(nonatomic, copy) NSString *codeCode;
@property(nonatomic, copy) NSString *codeName;
@property(nonatomic, copy) NSString *codeValue;


/////items
@property(nonatomic, copy) NSArray *xbItem;

@end

NS_ASSUME_NONNULL_END
