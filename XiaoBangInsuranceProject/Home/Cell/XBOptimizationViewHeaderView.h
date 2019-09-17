//
//  XBOptimizationTableViewHeaderView.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/14.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class XBOptimizationViewHeaderView;
@protocol XBOptimizationHeaderDelegate <NSObject>

- (void)xb_optimizationHeader:(XBOptimizationViewHeaderView *) header didSelectTagIndex:(NSInteger)index;

@end

@interface XBOptimizationViewHeaderView : UIView

@property (nonatomic, weak)id <XBOptimizationHeaderDelegate> delegate;



- (void)xb_OptimizationHeaderView:(NSArray *)titleArr tips:(NSArray *)tipsArray;

+(instancetype)initWithXib;

@property(nonatomic, assign) NSInteger defultSelect;

@end

NS_ASSUME_NONNULL_END
