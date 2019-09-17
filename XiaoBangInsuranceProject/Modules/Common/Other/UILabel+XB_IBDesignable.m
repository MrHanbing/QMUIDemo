//
//  UILabel+XB_IBDesignable.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/6.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "UILabel+XB_IBDesignable.h"
#import "XBDeVice.h"
@implementation UILabel (XB_IBDesignable)

static char kAssociatedObjectKey_consultFontSize;

-(void)setConsultFontSize:(CGFloat)consultFontSize{
    CGFloat fontsize = consultFontSize *   [XBDeVice pixelPerInchScal];
    self.font = [UIFont systemFontOfSize:fontsize < self.miniFontSize?self.miniFontSize:fontsize];
     objc_setAssociatedObject(self, &kAssociatedObjectKey_consultFontSize, @(consultFontSize), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGFloat)consultFontSize{
    return [((NSNumber *)objc_getAssociatedObject(self, &kAssociatedObjectKey_consultFontSize)) qmui_CGFloatValue];
}

static char kAssociatedObjectKey_miniFontSize;

-(void)setMiniFontSize:(CGFloat)miniFontSize{
    objc_setAssociatedObject(self, &kAssociatedObjectKey_miniFontSize, @(miniFontSize), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGFloat)miniFontSize{
    return [((NSNumber *)objc_getAssociatedObject(self, &kAssociatedObjectKey_miniFontSize)) qmui_CGFloatValue];
}

@end
