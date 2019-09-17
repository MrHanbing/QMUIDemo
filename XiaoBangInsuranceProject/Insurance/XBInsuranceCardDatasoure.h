//
//  XBInsuranceCardDatasoure.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/28.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XBMyInsuranceCardView.h"
NS_ASSUME_NONNULL_BEGIN

@interface XBInsuranceCardDatasoure : NSObject <XBMyInsuranceCardViewDelegate>

@property(nonatomic, strong) NSArray *insuranceList;

@end

NS_ASSUME_NONNULL_END
