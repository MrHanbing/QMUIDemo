//
//  XBOptimizationTagDataSource.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/12.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XBOptimizationTagDataSource <NSObject>
///标签数量
- (NSInteger)xb_OptimizationTagsCount;

///标签title
- (NSString *)xb_OptimizationTagsTitle:(NSInteger)index;

///Tips title
- (NSString *)xb_OptimizationTips:(NSInteger)index;


@end

NS_ASSUME_NONNULL_END
