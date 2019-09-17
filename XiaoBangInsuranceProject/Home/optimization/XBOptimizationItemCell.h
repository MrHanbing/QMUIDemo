//
//  XBOptimizationItemCell.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/12.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBOptimizationItemCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
-(void)xb_cellConfigureIcon:(NSString *)iconUrl withName:(NSString *)name withMarketingTags:(NSString *)marketingTags;
@end

NS_ASSUME_NONNULL_END
