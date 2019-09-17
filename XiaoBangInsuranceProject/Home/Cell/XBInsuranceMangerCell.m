//
//  XBInsuranceProgressCell.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/12.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBInsuranceMangerCell.h"
#import "XBAttributedLabel.h"
@interface XBInsuranceMangerCell  ()
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *userIcon;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet XBAttributedLabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIView *mangerBgView;

@property (weak, nonatomic) IBOutlet UIView *parseMangerBgView;
@property (weak, nonatomic) IBOutlet UIView *buyBgView;

@end

@implementation XBInsuranceMangerCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"XBInsuranceMangerCell";
    XBInsuranceMangerCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:ID bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (IBAction)parseInsurance:(id)sender {
    if ([self.delegate respondsToSelector:@selector(xb_insuranceMangerCell:selectParseInsuranceTarget:)]) {
        [self.delegate xb_insuranceMangerCell:self selectParseInsuranceTarget:sender];
    }
}
- (IBAction)buyServers:(id)sender {
    if ([self.delegate respondsToSelector:@selector(xb_insuranceMangerCell:selectBuyServersTarget:)]) {
        [self.delegate xb_insuranceMangerCell:self selectBuyServersTarget:sender];
    }
}
- (IBAction)mangerInsurance:(id)sender {
    if ([self.delegate respondsToSelector:@selector(xb_insuranceMangerCell:selectMangerInsuranceTarget:)]) {
        [self.delegate xb_insuranceMangerCell:self selectMangerInsuranceTarget:sender];
    }
}

@end
