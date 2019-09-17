//
//  XBBordeRadiusView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBBordeRadiusView.h"

@implementation XBBordeRadiusView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self =[super initWithCoder:aDecoder];
    if (self) {
            self.layer.shadowColor = UIColorGray.CGColor;
            self.layer.shadowOpacity = .1;
            self.layer.shadowRadius = 20;
            self.layer.shadowOffset = CGSizeMake(0, 10);
        self.layer.cornerRadius = 12;
        self.layer.qmui_maskedCorners = QMUILayerMinXMinYCorner|QMUILayerMaxXMinYCorner|QMUILayerMinXMaxYCorner|QMUILayerMaxXMaxYCorner;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.shadowColor = UIColorGray.CGColor;
        self.layer.shadowOpacity = .1;
        self.layer.shadowRadius = 20;
//        self.layer.shadowOffset = CGSizeMake(10, 10);
        self.layer.cornerRadius = 12;
        self.layer.qmui_maskedCorners = QMUILayerMinXMinYCorner|QMUILayerMaxXMinYCorner|QMUILayerMinXMaxYCorner|QMUILayerMaxXMaxYCorner;
    }
    return self;
    
}

@end
