//
//  XBMyInsuranceCardCell.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/27.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBMyInsuranceCardCell.h"
#import "XBMyInsuranceCardView.h"
@interface XBMyInsuranceCardCell()


@end

@implementation XBMyInsuranceCardCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"XBMyInsuranceCardCell";
    XBMyInsuranceCardCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerClass:[XBMyInsuranceCardCell class] forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self _configerSub];
    }
    return self;
}
- (void)_configerSub{
    [self.contentView addSubview:self.cardView];
    [self.cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

- (XBMyInsuranceCardView *)cardView{
    if (!_cardView) {
        _cardView = [XBMyInsuranceCardView initWithXib];
    }
    return _cardView;
}

@end
