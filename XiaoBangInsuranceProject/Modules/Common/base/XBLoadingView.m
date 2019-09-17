//
//  XBLoadingView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/5.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBLoadingView.h"

@implementation XBLoadingView

+(instancetype)initWithXib{
    XBLoadingView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    [view awakeFromNib];
    return view;
}

@end
