//
//  XBInsturanceCell.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "QMUITableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface XBInsturanceCell : QMUITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

-(void)xb_cellConfigerTitle:(NSString *)title insuranceSource:(NSInteger)source  insuranceBaseCredit:(CGFloat)baseCredit insuranceSuggest:(NSString *)suggest insuranceTags:(NSString *) tags;

@end

NS_ASSUME_NONNULL_END
