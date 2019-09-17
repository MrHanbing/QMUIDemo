//
//  XBScrollwHeaderView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/22.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBScrollHeaderView.h"
#import "XBAnimationView.h"

@implementation XBScrollHeaderView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *result = [super hitTest:point withEvent:event];
    if (result == self) {
        return nil;
    } else {
        return result;
    }
}

@end
