//
//  XBPriceLabel.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "QMUILabel.h"

@interface XBAttributedLabel : QMUILabel

@property(nonatomic, strong) UIFont *highLightFont;
@property(nonatomic, strong) UIFont *highLightTextColor;
@property(nonatomic, strong) UIFont *OtherFont;
@property(nonatomic, strong) UIColor *OtherTextColor;
@property(nonatomic, assign)CGFloat space;
- (void)xb_HighlightText:(NSString *)highLightText withDefultText:(NSString *)defultText;

@end

