//
//  XBOptimizationCell.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/12.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol XBOptimizationCellDelegate <NSObject>

////


@end

@protocol XBOptimizationCellDataSource <NSObject>


///标签数量
- (NSInteger)xb_OptimizationTagsCount;

///标签title
- (NSString *)xb_OptimizationTagsTitle:(NSInteger)index;

///Tips title
- (NSString *)xb_OptimizationTips:(NSInteger)index;

- (NSInteger)xb_OptimizationTableView:(UITableView *)tableView  numberOfRowsInSection:(NSInteger)section tagIndex:(NSInteger)index;

- (void)xb_OptimizationHeight:(CGFloat)height;





@end
@interface XBOptimizationCell : UITableViewCell

@property (nonatomic, weak)id<XBOptimizationCellDataSource> OptimizationDataSource;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
