//
//  XBInsuranceHeaderP.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/28.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XBInsuranceHeader.h"
NS_ASSUME_NONNULL_BEGIN
@class XBInsuranceHeaderDelegate;

@interface XBInsuranceHeaderP : NSObject <XBInsuranceHeaderDelegate>

@property(nonatomic, weak) UIViewController *ctr;
@property(nonatomic, assign) NSInteger selectIndex;

- (void)xb_insuranceHeaderP_configer_data:(NSArray *)dataArr;

@end

NS_ASSUME_NONNULL_END
