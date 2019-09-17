//
//  XBHomeWelcomeCell.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/30.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBHomeWelcomeCell.h"

@implementation XBHomeWelcomeCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"XBHomeWelcomeCell";
    XBHomeWelcomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:ID bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
