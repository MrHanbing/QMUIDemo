//
//  XBTableViewHeaderView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/14.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBHomeSessionHeaderView.h"
@interface XBHomeSessionHeaderView()
@property (weak, nonatomic) IBOutlet QMUIButton *btn;

@end

@implementation XBHomeSessionHeaderView
+(instancetype)initWithXib{
    XBHomeSessionHeaderView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    [view awakeFromNib];
    return view;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.btn.imagePosition = QMUIButtonImagePositionRight;
    self.btn.spacingBetweenImageAndTitle = 8;
    [self.btn sizeToFit];
}
@end
