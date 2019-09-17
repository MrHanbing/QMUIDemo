//
//  UIButton+XB_IBDesignable.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/6.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (XB_IBDesignable)
/**
 参考字体大小
 */

@property(nonatomic, assign) IBInspectable CGFloat consultFontSize;
@property(nonatomic, assign) IBInspectable CGFloat miniFontSize;


@end

NS_ASSUME_NONNULL_END
