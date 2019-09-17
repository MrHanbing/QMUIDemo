//
//  XBHomeControllerManage.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/31.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XBHomeHeader.h"
#import "XBInsuranceMangerCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface XBHomeControllerManage : NSObject <XBHomeHeaderDelegate,XBInsuranceMangerDelegate>
- (instancetype)initWithController:(UIViewController *)ctr;

-(void)xb_ctrMangagePushArticleDetail:(NSInteger)articleID;

-(void)xb_ctrMangagePushInsuranceDetail:(NSString *)insuranceID;

@end

NS_ASSUME_NONNULL_END
