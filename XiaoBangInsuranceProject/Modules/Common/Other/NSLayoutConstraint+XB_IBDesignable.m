//
//  NSLayoutConstraint+XB_IBDesignable.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/6.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "NSLayoutConstraint+XB_IBDesignable.h"
#import "XBDeVice.h"
@implementation NSLayoutConstraint (XB_IBDesignable)

static char kAssociatedObjectKey_adapterScreen;

-(void)setAdapterScreen:(BOOL)adapterScreen{
    if(adapterScreen){
        self.constant = self.constant *[XBDeVice pixelPerInchScal];
    }
     objc_setAssociatedObject(self, &kAssociatedObjectKey_adapterScreen, @(adapterScreen), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)adapterScreen{
    return [((NSNumber *)objc_getAssociatedObject(self, &kAssociatedObjectKey_adapterScreen)) boolValue];
}

@end
