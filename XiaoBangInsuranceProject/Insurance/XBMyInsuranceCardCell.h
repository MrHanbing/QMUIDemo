//
//  XBMyInsuranceCardCell.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/27.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class XBMyInsuranceCardView;

@interface XBMyInsuranceCardCell : UITableViewCell
@property (nonatomic, strong)XBMyInsuranceCardView *cardView;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
