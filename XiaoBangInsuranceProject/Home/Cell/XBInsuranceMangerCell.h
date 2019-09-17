//
//  XBInsuranceProgressCell.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/12.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class XBInsuranceMangerCell;

@protocol XBInsuranceMangerDelegate <NSObject>
-(void)xb_insuranceMangerCell:(XBInsuranceMangerCell *)cell selectParseInsuranceTarget:(id)target;
-(void)xb_insuranceMangerCell:(XBInsuranceMangerCell *)cell selectBuyServersTarget:(id)target;
-(void)xb_insuranceMangerCell:(XBInsuranceMangerCell *)cell selectMangerInsuranceTarget:(id)target;
@end

@interface XBInsuranceMangerCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic, weak) id <XBInsuranceMangerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
