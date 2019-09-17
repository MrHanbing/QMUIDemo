//
//  XBInsuranceNetWork.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^XBInsuranceNetWorkSuccessBlock)(NSArray *dataList);
NS_ASSUME_NONNULL_BEGIN

@class XBInsuranceHomePageModel,XBInsuranceGoodTypeList;
@interface XBInsuranceNetWork : NSObject

@property(nonatomic, assign) NSInteger selectIndex;

@property(nonatomic, strong) NSMutableArray *familyList;

@property(nonatomic, strong) XBInsuranceHomePageModel *homePageModel;

-(XBInsuranceGoodTypeList *)xb_goodTypeListAtIndex:(NSInteger)index;

-(void)xb_startRequestHomePage;

@property(nonatomic, copy) XBInsuranceNetWorkSuccessBlock xbInsuranceNetWorkSuccessBlock;

@end

NS_ASSUME_NONNULL_END
