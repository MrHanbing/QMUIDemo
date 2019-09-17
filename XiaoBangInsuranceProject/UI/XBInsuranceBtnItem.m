//
//  XBInsuranceBtnItem.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/23.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBInsuranceBtnItem.h"

@interface XBInsuranceBtnItem ()

@property (nonatomic, strong)QMUILabel *tipLabel;

@end

@implementation XBInsuranceBtnItem

- (void)didInitialize{
    [super didInitialize];
    self.imagePosition = QMUIButtonImagePositionTop;
    self.spacingBetweenImageAndTitle = 12;
    [self addSubview:self.tipLabel];
    self.tipLabel.text = @"待分配";
}

- (QMUILabel *)tipLabel{
    if (!_tipLabel) {
        _tipLabel = [[QMUILabel alloc]init];
        _tipLabel.layer.cornerRadius = 10;
        _tipLabel.layer.masksToBounds = YES;
        _tipLabel.backgroundColor = [UIColor orangeColor];
        _tipLabel.textColor = [UIColor whiteColor];
        _tipLabel.font = [UIFont systemFontOfSize:12];
        _tipLabel.contentEdgeInsets = UIEdgeInsetsMake(4, 8, 4, 8);
    }
    return _tipLabel;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect imageRect = self.imageView.frame;
    CGSize tipSize =[self.tipLabel sizeThatFits:CGSizeMake((self.qmui_width - self.imageView.qmui_width)/2.0, 20)];
    self.tipLabel.frame = CGRectMake(CGRectGetMaxX(imageRect) -8, CGRectGetMinY(imageRect)-10, tipSize.width, 20);
}
@end
