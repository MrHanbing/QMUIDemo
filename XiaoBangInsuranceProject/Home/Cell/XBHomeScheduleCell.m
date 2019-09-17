//
//  XBHomeScheduleCell.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/30.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBHomeScheduleCell.h"
#import "XBTimeLine.h"
@interface XBHomeScheduleCell ()
@property (weak, nonatomic) IBOutlet XBTimeLine *timeLine;
@property (weak, nonatomic) IBOutlet UIView *cardView;

@end

@implementation XBHomeScheduleCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"XBHomeScheduleCell";
    XBHomeScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:ID bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.cardView.layer.cornerRadius = 4;
    self.cardView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
