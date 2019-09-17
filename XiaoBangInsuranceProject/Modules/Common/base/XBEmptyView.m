//
//  XBEmptyView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/5.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBEmptyView.h"

@implementation XBEmptyView

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize size = [self.actionButton sizeThatFits:CGSizeMake(SCREEN_WIDTH, 40)];
    self.actionButton.height = 40;
    self.actionButton.width = size.width + 52;
    self.actionButton.centerX = self.imageView.centerX;
    self.actionButton.layer.cornerRadius = 20;
    self.actionButton.layer.masksToBounds = YES;
    
    self.frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}
@end
